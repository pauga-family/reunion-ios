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

// Preview data
extension EventModel {
    static var debugEventModel: EventModel = EventModel(id: UUID(), name: "Event number 1", location: "Laulii", date: Date(), details: "This will be a super cool event and you should definitely go!")
    static func debugEventModels(count: Int) -> [EventModel] {
        var models: [EventModel] = []
        for num in 0...count {
            models.append(EventModel(id: UUID(), name: "Event number \(num)", location: "Laulii", date: Date().addingTimeInterval(TimeInterval(num) * 60 * 60), details: "This will be a super cool event and you should definitely go!"))
        }
        return models
    }
}
