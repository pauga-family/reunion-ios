//
//  EventDetailView.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 9/1/25.
//

import SwiftUI
import MapKit

struct EventDetailView: View {
    var event: EventModel
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM"
        return formatter
    }()
    
    private let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter
    }()
    
    
    // MARK: - View Body
    var body: some View {
        ZStack {
            banner
            ScrollView {
                detailsContainer
                    .padding(.top, 240)
            }
        }
        .ignoresSafeArea(.all)
        .background(Color.white)
    }
}

// MARK: - Private view code
private extension EventDetailView {
    var banner: some View {
        Image("samoan_fale_banner")
            .resizable()
            .frame(maxWidth: .infinity)
    }
    
    var detailsContainer: some View {
        VStack {
            eventDetailsHeader
            VStack(alignment: .leading) {
                eventDetailsBody
                Divider()
                    .padding(.vertical, 8)
                mapView
                NavigationLink(
                    destination: ModifyEventView(viewModel: ModifyEventViewModel(event: event))) {
                        Text("Edit event")
                            .font(LatoFont.regular.font(size: 16))
                            .padding()
                            .foregroundColor(Color.onColor)
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(gradient: Gradients.secondaryToTertiary.gradient, startPoint: .leading, endPoint: .trailing)
                            )
                            .clipShape(Capsule())
                            .padding(.horizontal, 20)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.top, 8)
            }
            .padding(.top, 16)
            .padding(.bottom, 100)
        }
        .padding(.horizontal, 16)
        .background(Color.white)
        .clipShape(
            UnevenRoundedRectangle(
                topLeadingRadius: 30,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: 30
            ))
        .ignoresSafeArea(.all)
    }
    
    var eventDetailsHeader: some View {
        VStack {
            Text(event.name)
                .font(LatoFont.bold.font(size: 30))
                .foregroundStyle(Color.onWhite)
            iconRow
        }
        .padding(.top)
    }
    
    var eventDetailsBody: some View {
        VStack(alignment: .leading) {
            Text("Event Details:")
                .font(LatoFont.hairline.font(size: 16))
                .padding(.bottom, 4)
            Text(event.details)
                .font(LatoFont.regular.font(size: 20))
        }
    }
    
    var iconRow: some View {
        HStack {
            dateElement
                .padding(.trailing, 40)
            timeElement
        }
    }
    
    var dateElement: some View {
        HStack {
            VStack {
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(8)
            }
            .background(Color.secondary)
            .clipShape(Circle())
            VStack(spacing: 4) {
                Text("Date")
                    .font(LatoFont.hairline.font(size: 12))
                Text(dateFormatter.string(from: event.date))
                    .font(LatoFont.regular.font(size: 16))
            }
        }
    }
    var timeElement: some View {
        HStack {
            VStack {
                Image(systemName: "clock")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(8)
            }
            .background(Color.secondary)
            .clipShape(Circle())
            VStack(spacing: 4) {
                Text("Time")
                    .font(LatoFont.hairline.font(size: 12))
                Text(timeFormatter.string(from: event.date))
                    .font(LatoFont.regular.font(size: 16))
            }
        }
    }
    
    
    var mapView: some View {
        VStack(alignment: .leading) {
            Text("Location:")
                .font(LatoFont.bold.font(size: 16))
            Map()
                .frame(height: 300)
        }
    }
}

#Preview {
    EventDetailView(event: EventModel.debugEventModel)
}
