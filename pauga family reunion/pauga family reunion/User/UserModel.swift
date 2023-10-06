//
//  UserModel.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 9/17/23.
//

import Foundation

struct UserModel {
    let id: UUID
    let firstName: String
    let lastName: String
    let email: String
    let mataiTitle: String?
    let photoURL: String?
    let details: String?
}
