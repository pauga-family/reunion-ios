//
//  DemoPage.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 8/20/23.
//

import SwiftUI

struct DemoPage: View {
    var body: some View {
        VStack {
            headerView
            calendarSelection
            scheduleView
            Spacer()
        }
    }
}

private extension DemoPage {
    var headerView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Hello Justin")
                    .font(.body)
                    .fontWeight(.ultraLight)
                    .padding(.bottom, 6)
                Text("There are 5\nevents today")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
            Image("Profile")
                .resizable()
                .frame(width: 50, height: 50)
        }
        .padding()
    }
    
    var calendarSelection: some View {
        HStack {
            calendarDay(day: "Mon", number: "18", isSelected: false)
            calendarDay(day: "Tue", number: "19", isSelected: false)
            calendarDay(day: "Wed", number: "20", isSelected: true)
            calendarDay(day: "Thur", number: "21", isSelected: false)
            calendarDay(day: "Fri", number: "22", isSelected: false)
            calendarDay(day: "Sat", number: "23", isSelected: false)
            calendarDay(day: "Sun", number: "24", isSelected: false)
        }
        .padding()
    }
    
    func calendarDay(day: String, number: String, isSelected: Bool) -> some View {
        VStack {
            Text(number)
                .fontWeight(isSelected ? .bold : .regular)
                .foregroundColor(isSelected ? .white : .black)
            Text(day)
                .fontWeight(isSelected ? .bold : .regular)
                .foregroundColor(isSelected ? .white : .black)
        }
        .padding(.horizontal, 6)
        .padding(.vertical)
        .background(isSelected ? Color.black : Color.clear)
        .cornerRadius(20)
    }
    
    var scheduleView: some View {
            VStack {
                Text("Today's Schedule")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.bottom, 4)
                Text("\(Date.now.formatted(.dateTime.day().month().year()))")
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.bottom, 8)
                HStack {
                    timeline
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(Event.demoDay, id: \.id) { event in
                            cardView(for: event)
                        }
                    }
                }
            }
    }
    
    var timeline: some View {
        VStack {
            Image(systemName: "circle.fill")
                .padding(.top, 60)
            VStack {
                Text("")
            }
            .frame(width: 1, height: 160)
            .background(Color.black)
            Image(systemName: "circle.fill")
            VStack {
                Text("")
            }
            .frame(width: 1, height: 160)
            .background(Color.black)
            Image(systemName: "circle.fill")
            Spacer()
        }
    }
    
    func cardView(for event: Event) -> some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(event.name) - \(event.time)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom, 8)
                    Text(event.details)
                        .font(.caption)
                }
                Spacer()
                Image("sample")
                    .resizable()
                    .frame(width: 80, height: 80)
            }
            .padding()
        }
        .background(Color.blue)
        .cornerRadius(8)
        .padding()
    }
}

struct DemoPage_Previews: PreviewProvider {
    static var previews: some View {
        DemoPage()
    }
}

struct Event {
    let id: UUID = UUID()
    let name: String
    let time: String
    let details: String
}

extension Event {
    static var demoDay: [Event] {
        return [
        Event(name: "Breakfast", time: "7:30am", details: "Meet at the fale for breakfast before we start our day"),
        Event(name: "Sports Day", time: "10:30am", details: "Come join us for sports day!\nA fun way for us to compete and see who is the best athlete in the family!\n Buss leaves at 10:00am"),
        Event(name: "Lunch", time: "12:30pm", details: "We'll eat lunch immediately after sports day. We'll be at one of the fales in front of the pool"),
        Event(name: "Free Swim", time: "1:00pm", details: "Free swim at the pool. We will leave the pool at 4pm"),
        Event(name: "Dinner", time: "7:00pm", details: "Join the family for dinner and hangout time to end the night")
        ]
    }
}
