//
//  UserModel.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 10/18/23.
//

import Foundation

public struct UserModel : Equatable, Sendable {
    public let id: Int
    public let firstName: String
    public let lastName: String
    public let email: String
    public let title: String?
    public let location: String?
    public let biography: String?

    public init(id: Int, firstName: String, lastName: String, email: String, title: String?, location: String?, biography: String?) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.title = title
        self.location = location
        self.biography = biography
    }

    public init(with loginModel: UserLoginModel) {
        self.id = loginModel.id
        self.firstName = loginModel.firstName
        self.lastName = loginModel.lastName
        self.email = loginModel.email
        self.title = nil
        self.location = nil
        self.biography = nil
    }
}

public struct UserLoginModel : Codable {
    public let token: String
    public let id: Int
    public let firstName: String
    public let lastName: String
    public let email: String

    public init(token: String, id: Int, firstName: String, lastName: String, email: String) {
        self.token = token
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }

    enum CodingKeys : String, CodingKey {
        case token = "access_token"
        case id, firstName, lastName, email
    }
}
