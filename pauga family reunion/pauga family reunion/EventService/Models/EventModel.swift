//
//  EventModel.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/15/24.
//

import Foundation

struct EventModel {
    var id: UUID
    var name: String
    var location: String
    var date: Date
    var details: String
    var attendees: [UserModel]?
}
