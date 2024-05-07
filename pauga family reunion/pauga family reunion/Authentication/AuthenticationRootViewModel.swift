//
//  AuthenticationRootViewModel.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 10/18/23.
//

import Foundation

protocol AuthenticationDelegate {
    func didSuccessfullyLogIn()
}

class AuthenticationRootViewModel : ObservableObject {
    var signInViewModel: SignInViewModel {
        SignInViewModel(authenticationDelegate: delegate)
    }
    
    var signUpViewModel: SignupViewModel {
        SignupViewModel(authenticationDelegate: delegate)
    }
    private let delegate: AuthenticationDelegate
    
    init(delegate: AuthenticationDelegate) {
        self.delegate = delegate
    }
}
