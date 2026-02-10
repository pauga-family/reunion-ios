//
//  ModifyEventViewModel.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/23/25.
//

import Foundation

enum ModifyEventViewMode {
    case edit, new
}

class ModifyEventViewModel : ObservableObject {
    // MARK: - Published variables
    @Published var event: EventModel?
    @Published var eventName: String = ""
    @Published var eventDate: Date = Date()
    @Published var eventDetails: String = ""
    @Published var isShowingError: Bool = false
    
    // MARK: - Non published variables
    var mode: ModifyEventViewMode = .new
    let headerText: String
    let submitButtonText: String
    let eventNamePlaceholder = "Event name"
    let eventDatePlaceholder = "Event date"
    let eventLocationPlaceholder = "Event location"
    let eventDetailsPlaceholder = "Event details"
    
    var alertTitle: String
    let alertButtonText = "Ok"
    
    var errorMessages: [String] = []
    
    
    init(event: EventModel?) {
        if let event {
            self.event = event
            self.eventName = event.name
            self.eventDate = event.date
            self.eventDetails = event.details
            mode = .edit
        }
        headerText = mode == .new ? "Create Event" : "Edit Event"
        submitButtonText = mode == .new ? "Create Event" : "Save Changes"
        alertTitle = "Please make sure \(mode == .new ? "the following fields have been filled in" : "the event has updated"):"
    }
    
    func submitButtonTapped() {
        switch mode {
        case .edit:
            updateEvent()
        case .new:
            createNewEvent()
        }
    }
    
    func alertDismissed() {
        errorMessages = []
    }
    
    private func updateEvent() {
        guard eventName != event?.name || eventDate != event?.date || eventDetails != event?.details else {
            errorMessages.append("No changes to save")
            isShowingError = true
            return
        }
        
    }
    
    private func createNewEvent() {
        if eventName.isEmpty {
            errorMessages.append("Event name")
        }
        
        if eventDetails.isEmpty {
            errorMessages.append("Event details")
        }
        
        guard errorMessages.isEmpty else {
            isShowingError = true
            return
        }
    }
}
