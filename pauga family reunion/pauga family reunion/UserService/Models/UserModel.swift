//
//  UserModel.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 10/18/23.
//

import Foundation

struct UserModel : Equatable {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    let title: String?
    let location: String?
    let biography: String?
    
    init(id: Int, firstName: String, lastName: String, email: String, title: String?, location: String?, biography: String?) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.title = title
        self.location = location
        self.biography = biography
    }
    
    init(with loginModel: UserLoginModel) {
        self.id = loginModel.id
        self.firstName = loginModel.firstName
        self.lastName = loginModel.lastName
        self.email = loginModel.email
        self.title = nil
        self.location = nil
        self.biography = nil
    }
}

struct UserLoginModel : Codable {
    let token: String
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    
    enum CodingKeys : String, CodingKey {
        case token = "access_token"
        case id, firstName, lastName, email
    }
}
