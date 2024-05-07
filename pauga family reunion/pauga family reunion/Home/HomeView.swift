//
//  HomeView.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 5/5/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        if viewModel.userLoggedIn {
            Text("User logged in successfully")
        } else {
            AuthenticationRootView(viewModel: viewModel.authenticationRootViewModel)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(userService: UserService.shared))
}
