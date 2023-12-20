//
//  SignInViewModel.swift
//  pauga family reunion
//
//  Created by Tuliloa Pauga on 12/14/23.
//

import Foundation

enum SignInLoadingState {
    case loading, success, failure(Error)
}

class SignInViewModel : ObservableObject {
    @Published var userName = ""
    @Published var password = ""
    @Published var loadingState: SignInLoadingState = .loading
}
