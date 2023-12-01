//
//  EndpointProvider.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/26/23.
//

import Foundation

enum RequestMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

protocol APIProviding {
    var scheme: String { get }
    var baseURL: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var token: String { get }
    var queryItems: [URLQueryItem]? { get }
    var body: [String: Any]? { get }
    var mockFile: String? { get }
}

// MARK: - Default implementation
extension APIProviding {
    var scheme: String {
        APIConfig.shared.scheme
    }
    var baseURL: String {
        APIConfig.shared.baseURL
    }
    
    var token: String {
        APIConfig.shared.token?.token ?? ""
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = baseURL
        urlComponents.path = path
        urlComponents.port = 8000
        if let queryItems {
            urlComponents.queryItems = queryItems
        }
        guard let url = urlComponents.url else {
            throw APIError(errorCode: "ERROR-0", message: "URL Error")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("true", forHTTPHeaderField: "X-Use-Cache")
        
        if !token.isEmpty {
            urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorizaion")
        }
        
        if let body {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            } catch {
                throw APIError(errorCode: "ERROR-0", message: "Error encoding http body")
            }
        }
        return urlRequest
    }
}
