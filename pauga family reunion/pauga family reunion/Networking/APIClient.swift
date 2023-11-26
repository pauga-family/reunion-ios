//
//  APIClient.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/26/23.
//

import Foundation

public final class APIClient: APIClientProtocol {
    var session: URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = 60 // Wait max of 60 seconds for response
        configuration.timeoutIntervalForResource = 300 // Wait max of 300 seconds for entire resource to complete
        return URLSession(configuration: configuration)
    }
    
    func request<T>(endpoint: APIProviding, responseModel: T.Type) async throws -> T where T : Decodable {
        do {
            let (data, response) = try await session.data(for: endpoint.asURLRequest())
            return try self.manageResponse(data: data, response: response)
        } catch let error as ApiError {
            throw error
        } catch {
            throw ApiError(
                errorCode: "Error-0",
                message: "Unknown API error \(error.localizedDescription)"
            )
        }
    }
    
    private func manageResponse<T: Decodable>(data: Data, response: URLResponse) throws -> T {
        guard let response = response as? HTTPURLResponse else {
            throw ApiError(
                errorCode: "Error-0",
                message: "Invalid HTTP Response"
            )
        }
        switch response.statusCode {
        case 200...299:
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw ApiError(
                    errorCode: KnownErrors.decodingDataError.rawValue,
                    message: "Error decoding data"
                )
            }
        default:
            guard let decodedError = try? JSONDecoder().decode(ApiError.self, from: data) else {
                throw ApiError(
                    statusCode: response.statusCode,
                    errorCode: "Error - 0",
                    message: "Unknown backend error"
                )
            }
            if response.statusCode == 403 /*&& decodedError == KnownErrors.expiredToken.rawValue */{
                NotificationCenter.default.post(name: .terminateSession, object: self)
            }
            throw ApiError(
                statusCode: response.statusCode,
                errorCode: decodedError.errorCode,
                message: decodedError.message
            )
        }
    }
}
