//
//  APIClientProviding.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/26/23.
//

import Foundation

protocol APIClientProtocol {
    func request<T: Decodable>(endpoint: APIProviding, responseModel: T.Type) async throws -> T
}
