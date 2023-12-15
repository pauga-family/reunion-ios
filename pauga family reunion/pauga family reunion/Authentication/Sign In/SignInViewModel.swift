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
    @Published var emailAddress = ""
    @Published var password = ""
    @Published var loadingState: SignInLoadingState = .loading
    
    func ctaTapped() {
        print("Sign In Button tapped")
        test("tuli")
    }
    
    func test(_ name: String) {
        print(name)
    }
}



