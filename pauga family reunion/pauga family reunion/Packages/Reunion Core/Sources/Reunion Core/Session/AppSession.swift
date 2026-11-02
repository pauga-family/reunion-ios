//
//  AppSession.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/1/26.
//

import Foundation
import Observation

/// Single source of truth for the app's logged-in state.
///
/// `UserService` is not observable, so `AppSession`
/// stores `currentUser` itself and refreshes it after every auth call that goes
/// through it.
@MainActor
@Observable
public final class AppSession {
    public private(set) var currentUser: UserModel?

    public var isLoggedIn: Bool {
        currentUser != nil
    }

    @ObservationIgnored
    private let userService: UserServicable

    public init(userService: UserServicable = UserService.shared) {
        self.userService = userService
        self.currentUser = userService.getCurrentUser()
    }

    public func signIn(email: String, password: String) async throws {
        try await userService.signIn(email: email, password: password)
        refresh()
    }

    public func signUp(firstName: String, lastName: String, email: String, password: String) async throws {
        try await userService.signUp(firstName: firstName, lastName: lastName, email: email, password: password)
        refresh()
    }

    public func logOut() {
        userService.logUserOut()
        refresh()
    }

    /// Re-reads the current user from `UserService`.
    public func refresh() {
        currentUser = userService.getCurrentUser()
    }
}
