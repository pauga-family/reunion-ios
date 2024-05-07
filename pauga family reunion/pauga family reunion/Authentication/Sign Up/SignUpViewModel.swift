//
//  SignupViewModel.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 10/18/23.
//

import Foundation

enum SignUpLoadingState {
    case loading, finished
}

final class SignupViewModel : ObservableObject {
    // MARK: - Published variables
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var emailAddress = ""
    @Published var password = ""
    @Published var passwordConfirmation = ""
    @Published var loadingState: SignUpLoadingState = .finished
    @Published var showErrorAlert: Bool = false
    @Published var errorMessage: String = ""

    // MARK: - Private variables
    private let userService: UserServicable = UserService.shared
    private let authenticationDelegate: AuthenticationDelegate
    
    init(authenticationDelegate: AuthenticationDelegate) {
        self.authenticationDelegate = authenticationDelegate
    }
    
    func ctaTapped() {
        loadingState = .loading
        guard validateName(name: firstName),
                validateName(name: lastName),
                validateEmail(),
                validatePassword() else {
            return
        }
        signUserUp()
    }

    // MARK: - Private
    
    private func signUserUp() {
        Task {
            do {
                try await userService.signUp(firstName: firstName, lastName: lastName, email: emailAddress, password: password)
                await MainActor.run {
                    self.loadingState = .finished
                    authenticationDelegate.didSuccessfullyLogIn()
                }
            } catch let error as APIError {
                showErrorAlert(error: error)
            }
        }
    }

    private func validateName(name: String) -> Bool {
        if name.isEmpty {
            let error = KnownErrors.validationError(message: "First and last name is required").error
            showErrorAlert(error: error)
            return false
        }

        if name.count < 2 || name.count > 40 {
            let error = KnownErrors.validationError(message: "First and last name must be between 2 and 40 characters").error
            showErrorAlert(error: error)
            return false
        }

        let allowedCharacters = CharacterSet.letters
        let firstNameCharacters = CharacterSet(charactersIn: name)
        if !allowedCharacters.isSuperset(of: firstNameCharacters) {
            let error = KnownErrors.validationError(message: "First and last name must contain only letters").error
            showErrorAlert(error: error)
            return false
        }

        return true
    }

    private func validateEmail() -> Bool {
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
        guard password == passwordConfirmation else {
            let error = KnownErrors.validationError(message: "Passwords much match").error
            showErrorAlert(error: error)
            return false
        }

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
