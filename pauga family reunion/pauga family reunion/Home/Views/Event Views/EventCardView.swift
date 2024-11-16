//
//  EventCardView.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/15/24.
//

import SwiftUI

struct EventCardView: View {
    var event: EventModel
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(event.name)
                    Text(event.location)
                }
                Spacer()
                Text(event.date.timeFromDate() ?? "")
            }
            .padding(.bottom, 20)
            Text(event.details)
        }
        .frame(height: 150)
        .padding(.horizontal)
        .padding(.bottom, 20)
        .background(Color.secondary)
        .cornerRadius(15)
        .shadow(radius: 4)
    }
}

#Preview {
    EventCardView(event: EventModel(id: UUID(), name: "Test Event", location: "Somwhere Cool", date: Date(), details: "This is a super cool event that everyone should go to! It will be a ton of fun!"))
}
