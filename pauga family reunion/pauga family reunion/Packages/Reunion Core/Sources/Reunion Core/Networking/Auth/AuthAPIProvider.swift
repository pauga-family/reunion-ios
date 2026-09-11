//
//  AuthAPIClient.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/26/23.
//

import Foundation

public enum AuthAPIProvider: APIProviding {
    case createUser(email: String, firstName: String, lastName: String, password: String)
    case signIn(email: String, password: String)

    public var path: String {
        switch self {
        case .createUser:
            return "/auth/create-user"
        case .signIn:
            return "/auth/login"
        }
    }

    public var method: RequestMethod {
        switch self {
        case .createUser:
            return .post
        case .signIn:
            return .post
        }
    }

    public var queryItems: [URLQueryItem]? {
        switch self {
        default:
            return nil
        }
    }

    public var body: [String : Any]? {
        switch self {
        case .createUser(let email, let firstName, let lastName, let password):
            return [
                "email": email,
                "firstName": firstName,
                "lastName": lastName,
                "password": password
            ]
        case .signIn(let email, let password):
            return [
                "email": email,
                "password": password
            ]
        }
    }

    public var mockFile: String? {
        switch self {
        case .createUser:
            return "_createUserMockResponse"
        case .signIn:
            return nil
        }
    }
}
