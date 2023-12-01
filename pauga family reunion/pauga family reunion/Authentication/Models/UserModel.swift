//
//  UserModel.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 10/18/23.
//

import Foundation

struct UserModel : Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
}
