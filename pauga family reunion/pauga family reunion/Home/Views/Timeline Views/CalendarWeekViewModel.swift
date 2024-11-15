//
//  CalendarWeekViewModel.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/13/24.
//

import Foundation

enum WeekChangeStatus {
    case forward, backward
}

protocol CalendarWeekViewModelProtocol : ObservableObject {
    var dates: [Date] { get set }
    var selectedDate: Date { get set }
    var baseDate: Date { get set }
    func dateTapped(_ date: Date)
    func changeWeek(_ status: WeekChangeStatus)
}

class CalendarWeekViewModel : CalendarWeekViewModelProtocol {
    @Published var dates: [Date] = []
    @Published var selectedDate: Date = Date.now
    var baseDate: Date = Date.now
    
    init() {
        dates = selectedDate.weekDates()
    }
    
    func dateTapped(_ date: Date) {
        selectedDate = date
        dates = selectedDate.weekDates()
    }
    
    func changeWeek(_ status: WeekChangeStatus) {
        switch status {
        case .backward:
            baseDate = Calendar.current.date(byAdding: .day, value: -7, to: baseDate) ?? Date()
        case .forward:
            baseDate = Calendar.current.date(byAdding: .day, value: 7, to: baseDate) ?? Date()
        }
        
        dates = baseDate.weekDates()
    }
}
