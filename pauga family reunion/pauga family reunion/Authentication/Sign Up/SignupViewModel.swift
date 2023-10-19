//
//  SignupViewModel.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 10/18/23.
//

import Foundation

enum SignupLoadingState {
    case loading, success, failure(Error)
}
class SignupViewModel : ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var emailAddress = ""
    @Published var password = ""
    @Published var passwordConfirmation = ""
    @Published var loadingState: SignupLoadingState = .loading
    
    func ctaTapped() {
        print("button tapped")
    }
}
