//
//  CalendarWeekViewModel.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/13/24.
//

import Foundation
import Combine

enum WeekChangeStatus {
    case forward, backward
}

protocol CalendarWeekDataSource {
    var selectedDate: CurrentValueSubject<Date, Never> { get }
    var baseDate: CurrentValueSubject<Date, Never> { get }
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
    
    private var dataSource: CalendarWeekDataSource
    private var baseDateCancelleable: AnyCancellable?
    private var selectedDateCancellable: AnyCancellable?
    
    init(dataSource: CalendarWeekDataSource) {
        self.dataSource = dataSource
        baseDateCancelleable = dataSource.baseDate
            .sink { [weak self] in self?.baseDate = $0 }
        selectedDateCancellable = dataSource.selectedDate
            .sink { [weak self] in self?.selectedDate = $0 }
        dates = selectedDate.weekDates()
    }
    
    func dateTapped(_ date: Date) {
        dataSource.selectedDate.send(date)
        dataSource.baseDate.send(date)
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
