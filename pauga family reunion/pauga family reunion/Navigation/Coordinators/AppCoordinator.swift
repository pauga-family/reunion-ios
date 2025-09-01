//
//  AppCoordinator.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 12/10/24.
//

import Foundation

enum AppRoute : Route {
    case authentication, home
}

class AppCoordinator : Coordinator {
    typealias CoordinatorRoute = AppRoute
    
    let navigationContext = NavController()
    
    init() {}
    
    func navigate(to route: AppRoute) {
        switch route {
        case .authentication:
            navigationContext.setInitialView(view: AuthenticationRootView(viewModel: AuthenticationRootViewModel(delegate: self)))
        case .home:
            navigationContext.setInitialView(view: HomeView(viewModel: HomeViewModel(userService: UserService.shared)))
        }
    }
}

extension AppCoordinator : AuthenticationDelegate {
    func didSuccessfullyLogIn() {
        navigate(to: .home)
    }
}
