//
//  HomeViewModel.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 5/5/24.
//

import Foundation

final class HomeViewModel : ObservableObject {
    private let userService: UserServicable
    
    @Published var userLoggedIn: Bool = false
    var user: UserModel? {
        return userService.getCurrentUser()
    }
    
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
