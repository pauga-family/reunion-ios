//
//  SignupView.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 10/18/23.
//

import SwiftUI

struct SignupView: View {
    @ObservedObject var viewModel: SignupViewModel
    var body: some View {
        VStack(alignment: .center) {
            titleSection
            Spacer()
            if viewModel.loadingState == .loading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tint(.onColor)
            } else {
                firstNameSection
                lastNameSection
                emailSection
                passwordSection
                ctaButton
            }
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradients.extraWhiteExtraPrimaryBlack.gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .alert(isPresented: $viewModel.showErrorAlert) {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("Ok")))
        }
    }
}

private extension SignupView {
    var titleSection: some View {
        Text("Sign Up")
            .font(LatoFont.bold.font(size: 40))
            .fontWeight(.bold)
            .foregroundColor(.onWhite)
            .padding()
    }
    
    var firstNameSection: some View {
        TextField(
            "",
            text: $viewModel.firstName,
            prompt: Text("First Name")
                .foregroundColor(.onColor)
        )
            .font(LatoFont.regular.font(size: 16))
            .foregroundColor(.onColor)
            .multilineTextAlignment(TextAlignment.center)
            .textContentType(.name)
            .disableAutocorrection(true)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.onColor, lineWidth: 1)
            )
    }
    
    var lastNameSection: some View {
        TextField(
            "",
            text: $viewModel.lastName,
            prompt: Text("Last Name")
                .foregroundColor(.onColor)
        )
            .font(LatoFont.regular.font(size: 16))
            .foregroundColor(.onColor)
            .multilineTextAlignment(TextAlignment.center)
            .textContentType(.name)
            .disableAutocorrection(true)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.onColor, lineWidth: 1)
            )
            .padding(.top, 8)
    }
    
    var emailSection: some View {
        TextField("",
                  text: $viewModel.emailAddress,
                  prompt: Text("Email")
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
    
    var passwordSection: some View {
        VStack {
            SecureField("",
                        text: $viewModel.password,
                        prompt: Text("Password")
                            .foregroundColor(.onColor)
            )
                .font(LatoFont.regular.font(size: 16))
                .foregroundColor(.onColor)
                .multilineTextAlignment(TextAlignment.center)
                .textContentType(.password)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.onColor, lineWidth: 1)
                )
                .padding(.top, 8)
            SecureField("",
                        text: $viewModel.passwordConfirmation,
                        prompt: Text("Confirm Password")
                            .foregroundColor(.onColor)
            )
                .font(LatoFont.regular.font(size: 16))
                .foregroundColor(.onColor)
                .multilineTextAlignment(TextAlignment.center)
                .textContentType(.password)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.onColor, lineWidth: 1)
                )
                .padding(.top, 8)
        }
    }
    
    var ctaButton: some View {
        Button {
            viewModel.ctaTapped()
        } label: {
            Text("Create account")
                .font(LatoFont.regular.font(size: 16))
                .padding()
                .foregroundStyle(.white, .white)
        }
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(gradient: Gradients.secondaryToTertiary.gradient, startPoint: .leading, endPoint: .trailing)
        )
        .clipShape(Capsule())
        .padding()
        .padding(.top, 16)
    }
}

#Preview {
    SignupView(viewModel: SignupViewModel(apiClient: MockAPIClient()))
}
