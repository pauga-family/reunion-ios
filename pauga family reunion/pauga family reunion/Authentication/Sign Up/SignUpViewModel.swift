//
//  SignUpViewModel.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 9/17/23.
//

import Foundation

enum SignUpState {
    case loading, success, failure
}
class SignUpViewModel : ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var verifyPassword: String = ""
}
