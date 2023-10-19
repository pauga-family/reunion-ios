//
//  AuthenticationRootView.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 10/18/23.
//

import SwiftUI

struct AuthenticationRootView: View {
    @ObservedObject var viewModel: AuthenticationRootViewModel
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    headerContainer
                    Spacer()
                }
                .padding(.top, 30)
                .padding(.leading, 20)
                Spacer()
                signUpButton
                    .padding(.bottom, 8)
                loginButton
                    .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("blueBottomBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
            )
        }    }
}

private extension AuthenticationRootView {
    var headerContainer: some View {
        VStack(alignment: .leading) {
            Text("Welcome to the")
                .foregroundColor(Color.onWhite)
                .font(LatoFont.regular.font(size: 16))
            Text("Pauga Family Reunion")
                .foregroundColor(Color.onWhite)
                .font(LatoFont.bold.font(size: 40))
                .padding(.vertical, 1)
            Text("Embracing 'Aiga - Our Family, Our Strength!")
                .foregroundColor(Color.onWhite)
                .font(LatoFont.regular.font(size: 16))
        }
    }
    
    var signUpButton: some View {
        NavigationLink(destination: SignupView(viewModel: SignupViewModel())) {
            Text("Sign up")
                .font(LatoFont.regular.font(size: 16))
                .padding()
                .foregroundColor(Color.onColor)
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(gradient: Gradients.secondaryToTertiary.gradient, startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(Capsule())
                .padding(.horizontal, 20)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    var loginButton: some View {
        NavigationLink(destination: Text("Log in")) {
            Text("Log in")
                .font(LatoFont.regular.font(size: 16))
                .padding()
                .foregroundColor(Color.onWhite)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal, 20)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    AuthenticationRootView(viewModel: AuthenticationRootViewModel())
}
