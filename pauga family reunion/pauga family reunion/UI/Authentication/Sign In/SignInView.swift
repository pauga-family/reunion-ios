//
//  SignInView.swift
//  pauga family reunion
//
//  Created by Tuliloa Pauga on 12/14/23.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject var viewModel: SignInViewModel
    var body: some View {
        VStack(alignment: .center) {
            titleSection
            Spacer()
            if viewModel.loadingState == .loading {
                ProgressView()
            } else {
                emailField
                passwordField
                submitButton
            }
        }
        .padding()
        .padding([.bottom, .horizontal], 16)
        .background(
            LinearGradient(gradient: Gradients.extraWhiteExtraPrimaryBlack.gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .alert(isPresented: $viewModel.showErrorAlert) {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("Ok")))
        }
    }
}

private extension SignInView {
    var titleSection: some View {
        Text("Sign In")
            .font(LatoFont.bold.font(size: 40))
            .fontWeight(.bold)
            .foregroundColor(.onWhite)
            .padding()
    }
    
    var emailField: some View {
        TextField("",
                text: $viewModel.emailAddress,
                prompt: Text("Email")
                    .font(LatoFont.regular.font(size: 16))
                    .foregroundColor(.onColor)
        )
            .font(LatoFont.regular.font(size: 16))
            .foregroundColor(.onColor)
            .multilineTextAlignment(TextAlignment.center)
            .textContentType(.emailAddress)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.onColor, lineWidth: 1)
            )
            .padding(.top, 8)
    }
    
    var passwordField: some View {
        SecureField("",
            text: $viewModel.password,
            prompt: Text("Password")
                .font(LatoFont.regular.font(size: 16))
                .foregroundColor(.onColor)
        )
            .font(LatoFont.regular.font(size: 16))
            .foregroundColor(.onColor)
            .multilineTextAlignment(.center)
            .textContentType(.password)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.onColor, lineWidth: 1)
            )
            .padding(.top, 8)
    }
    
    var submitButton: some View {
        Button {
            viewModel.ctaTapped()
        } label: {
            Text("Sign In")
                .font(LatoFont.regular.font(size: 16))
                .foregroundColor(Color.onColor)
                .padding()
        }
        .frame(maxWidth: .infinity)
        .background(LinearGradient(gradient: Gradients.secondaryToTertiary.gradient, startPoint: .leading, endPoint: .trailing))
        .clipShape(Capsule())
        .padding(.top, 40)
    }
}

#Preview {
    SignInView(viewModel: SignInViewModel(authenticationDelegate: HomeViewModel(userService: UserService.shared)))
}
