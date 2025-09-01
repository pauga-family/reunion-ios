//
//  HomeViewModel.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 5/5/24.
//

import Foundation
import Combine

final class HomeViewModel : ObservableObject, CalendarWeekDataSource {
    private let userService: UserServicable
    
    // MARK: - Published Variables
    @Published var userLoggedIn: Bool = false
    var user: UserModel? {
        return userService.getCurrentUser()
    }
    @Published var selectedDate = CurrentValueSubject<Date, Never>(Date())
    @Published var baseDate = CurrentValueSubject<Date, Never>(Date())
    
    var authenticationRootViewModel: AuthenticationRootViewModel {
        AuthenticationRootViewModel(delegate: self)
    }
    
    init(userService: UserServicable) {
        self.userService = userService
        userLoggedIn = userService.getCurrentUser() != nil
    }
}

extension HomeViewModel : AuthenticationDelegate {
    func didSuccessfullyLogIn() {
        userLoggedIn = userService.getCurrentUser() != nil
    }
}
