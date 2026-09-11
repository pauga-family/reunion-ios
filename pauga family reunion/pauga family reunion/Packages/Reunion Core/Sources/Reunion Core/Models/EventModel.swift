//
//  EventModel.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/15/24.
//

import Foundation

public struct EventModel: Sendable {
    public var id: UUID
    public var name: String
    public var location: String
    public var date: Date
    public var details: String
    public var attendees: [UserModel]?

    public init(id: UUID, name: String, location: String, date: Date, details: String, attendees: [UserModel]? = nil) {
        self.id = id
        self.name = name
        self.location = location
        self.date = date
        self.details = details
        self.attendees = attendees
    }
}

// Preview data
public extension EventModel {
    static let debugEventModel: EventModel = EventModel(id: UUID(), name: "Event number 1", location: "Laulii", date: Date(), details: "This will be a super cool event and you should definitely go!")
    static func debugEventModels(count: Int) -> [EventModel] {
        var models: [EventModel] = []
        for num in 0...count {
            models.append(EventModel(id: UUID(), name: "Event number \(num)", location: "Laulii", date: Date().addingTimeInterval(TimeInterval(num) * 60 * 60), details: "This will be a super cool event and you should definitely go!"))
        }
        return models
    }
}
