//
//  CalendarWeekView.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/7/24.
//

import SwiftUI

struct CalendarWeekView<ViewModel: CalendarWeekViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        VStack {
            weekView
            detailDayView
        }
    }
}

private extension CalendarWeekView {
    var weekView: some View {
        VStack {
            HStack {
                NavigationLink(
                    destination: ModifyEventView(viewModel: ModifyEventViewModel(event: nil))) {
                        Text("Add new event")
                            .font(LatoFont.regular.font(size: 16))
                            .padding()
                            .foregroundColor(Color.blue)
                    }
                    .buttonStyle(PlainButtonStyle())
                DatePicker("", selection: $viewModel.baseDate, displayedComponents: .date)
                    .padding(.bottom, 4)
            }
            HStack {
                Image(systemName: "chevron.left")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .padding(.trailing, 2)
                    .onTapGesture {
                        viewModel.changeWeek(.backward)
                    }
                ForEach(viewModel.dates, id: \.self) { date in
                    dayView(date)
                }
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .padding(.leading, 2)
                    .onTapGesture {
                        viewModel.changeWeek(.forward)
                    }
            }
            .padding(.bottom, 16)
        }
    }
    
    var detailDayView: some View {
        VStack {
            detailedDayViewHeader
            ScrollView(showsIndicators: false) {
                HStack {
                    Divider()
                        .padding(.trailing, 4)
                    Spacer()
                    VStack {
                        //                    Text("No events found for today.")
                        //                        .font(LatoFont.medium.font(size: 40))
                        //                        .foregroundStyle(Color.onWhite)
                        //                        .multilineTextAlignment(.center)
                        //                    Spacer()
                        ForEach(1..<6) { num in
                            let event = EventModel(id: UUID(), name: "Event number \(num)", location: "Laulii", date: Date().addingTimeInterval(TimeInterval(num) * 60 * 60), details: "This will be a super cool event and you should definitely go!")
                            NavigationLink {
                                EventDetailView(event: event)
                            } label: {
                                EventCardView(event: event)
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
    
    var detailedDayViewHeader: some View {
        HStack {
            VStack {
                Text("Schedule")
                    .font(LatoFont.bold.font(size: 18))
                    .fontWeight(.bold)
                    .foregroundStyle(Color.onWhite)
                Text(viewModel.selectedDate.abbreviatedMonthFullDate() ?? "")
                    .font(LatoFont.medium.font(size: 12))
                    .foregroundStyle(Color.onWhite)
            }
            Spacer()
        }
        .padding()
    }
    
    func dayView(_ date: Date) -> some View {
        let components = date.get(.day)
        let isSelected = Calendar.current.isDate(viewModel.selectedDate, inSameDayAs: date)
        return VStack {
            Text(date.abbreviatedDayOfWeek() ?? "")
                .font(LatoFont.bold.font(size: 16))
                .foregroundStyle(isSelected ? Color.onColor : Color.primary)
                .padding(.bottom, 4)
            Text(components.description)
                .font(LatoFont.medium.font(size: 14))
                .foregroundStyle(isSelected ? Color.onColor : Color.primary)
        }
        .frame(width: 40, height: 60)
        .background(isSelected ? Color.primary : Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .onTapGesture {
            viewModel.dateTapped(date)
        }
    }
    
    var emptyDayView: some View {
        Text("No events found for today.")
            .font(LatoFont.medium.font(size: 40))
            .foregroundStyle(Color.onWhite)
            .multilineTextAlignment(.center)
    }
}
#Preview {
    CalendarWeekView(viewModel: CalendarWeekViewModel(dataSource: HomeViewModel(userService: UserService.shared)))
}
