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
            NavigationView {
                VStack {
                    Text("User logged in successfully")
                    NavigationLink("User details", destination: UserDetailView(user: UserService.shared.getCurrentUser()!))
                }
            }
        } else {
            AuthenticationRootView(viewModel: viewModel.authenticationRootViewModel)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(userService: UserService.shared))
}
