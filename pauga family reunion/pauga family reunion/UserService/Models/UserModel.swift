//
//  UserModel.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 10/18/23.
//

import Foundation

struct UserModel {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    
    init(id: Int, firstName: String, lastName: String, email: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
    
    init(with loginModel: UserLoginModel) {
        self.id = loginModel.id
        self.firstName = loginModel.firstName
        self.lastName = loginModel.lastName
        self.email = loginModel.email
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
