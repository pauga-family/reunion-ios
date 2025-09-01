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
                    loggedInView
                }
                .padding(.horizontal, 16)
            }
        } else {
            AuthenticationRootView(viewModel: viewModel.authenticationRootViewModel)
        }
    }
}

private extension HomeView {
    var loggedInView: some View {
            VStack {
                headerView
                    .padding(.bottom, 16)
                CalendarWeekView(viewModel: CalendarWeekViewModel(dataSource: viewModel))
                Spacer()
            }
    }
    
    var headerView: some View {
        HStack {
            Text("Hello \(viewModel.user?.firstName ?? "")")
                .font(LatoFont.medium.font(size: 16))
                .foregroundStyle(.gray)
                .padding(.bottom, 4)
            Spacer()
            NavigationLink {
                UserDetailView(user: viewModel.user!)
            } label: {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
        }
        .padding()
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(userService: UserService.shared))
}
