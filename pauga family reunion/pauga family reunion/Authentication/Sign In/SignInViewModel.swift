//
//  SignInViewModel.swift
//  pauga family reunion
//
//  Created by Tuliloa Pauga on 12/14/23.
//

import Foundation

enum SignInLoadingState {
    case loading, finished
}

class SignInViewModel : ObservableObject {
    // MARK: - Published Variables
    @Published var emailAddress = ""
    @Published var password = ""
    @Published var loadingState: SignInLoadingState = .finished
    @Published var showErrorAlert: Bool = false
    @Published var errorMessage: String = ""
    
    // MARK: - Private Variables
    private let userService: UserServicable = UserService.shared
    private let authenticationDelegate: AuthenticationDelegate
    
    init(authenticationDelegate: AuthenticationDelegate) {
        self.authenticationDelegate = authenticationDelegate
    }
    
    func ctaTapped() {
        loadingState = .loading
        guard validateEmail(),
              validatePassword() else {
            return
        }
        signUserIn()
    }
    
    private func signUserIn() {
        Task {
            do {
                try await userService.signIn(email: emailAddress, password: password)
                await MainActor.run {
                    self.loadingState = .finished
                    authenticationDelegate.didSuccessfullyLogIn()
                }
            } catch let error as APIError {
                showErrorAlert(error: error)
            }
        }
    }
    
    private func validateEmail() -> Bool {
        if (emailAddress.count < 2 || emailAddress.count > 40) {
            let error = KnownErrors.validationError(message: "Email address must be greater than 2 characters and less than 40").error
            showErrorAlert(error: error)
            return false
        }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES%@", emailRegEx)
        if !emailTest.evaluate(with: emailAddress) {
            let error = KnownErrors.validationError(message: "Please enter a valid email").error
            showErrorAlert(error: error)
            return false
        }
        return true
    }
    
    private func validatePassword() -> Bool {
        guard password.count > 8 else {
            let error = KnownErrors.validationError(message: "Password must be at least 8 characters").error
            showErrorAlert(error: error)
            return false
        }

        let passwordRegex = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[^a-zA-Z0-9]).{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)

        if !passwordTest.evaluate(with: password) {
            let error = KnownErrors.validationError(message: "Password must contain at least one capital letter, at least one number and at least one special character").error
            showErrorAlert(error: error)
            return false
        }

        return true
    }
    
    private func showErrorAlert(error: APIError) {
        errorMessage = error.message
        loadingState = .finished
        showErrorAlert = true
    }
}



