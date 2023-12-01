//
//  Mockable.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/26/23.
//

import Foundation

protocol Mockable : AnyObject {
    var bundle: Bundle { get }
    func loadJSON<T: Decodable>(filename: String, type: T.Type) -> T
}

extension Mockable {
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    func loadJSON<T: Decodable>(filename: String, type: T.Type) -> T {
        guard let path = bundle.url(forResource: filename, withExtension: "json") else {
            fatalError("Failed to load JSON")
        }
        
        do {
            let data = try Data(contentsOf: path)
            let decodedObject = try JSONDecoder().decode(type, from: data)
            
            return decodedObject
        } catch {
            fatalError("Failed to decode loaded JSON")
        }
    }
}

class MockAPIClient : Mockable, APIClientProtocol {
    func request<T>(endpoint: APIProviding, responseModel: T.Type) async throws -> T where T : Decodable {
        return loadJSON(filename: endpoint.mockFile!, type: responseModel.self)
    }
}
