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
            firstNameSection
            lastNameSection
            emailSection
            passwordSection
            ctaButton
        }
        .padding()
        .background(
                Image("blueTopBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
        )
    }
}

private extension SignupView {
    var titleSection: some View {
        Text("Sign Up")
            .font(LatoFont.bold.font(size: 40))
            .fontWeight(.bold)
            .foregroundColor(.onColor)
            .padding()
    }
    
    var firstNameSection: some View {
        TextField("First Name", text: $viewModel.firstName)
            .font(LatoFont.regular.font(size: 16))
            .foregroundStyle(.black, .black)
            .multilineTextAlignment(TextAlignment.center)
            .textContentType(.name)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.black, lineWidth: 1)
            )
    }
    
    var lastNameSection: some View {
        TextField("Last Name", text: $viewModel.lastName)
            .font(LatoFont.regular.font(size: 16))
            .multilineTextAlignment(TextAlignment.center)
            .textContentType(.name)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.black, lineWidth: 1)
            )
            .padding(.top, 8)
    }
    
    var emailSection: some View {
        TextField("Email", text: $viewModel.emailAddress)
            .font(LatoFont.regular.font(size: 16))
            .multilineTextAlignment(TextAlignment.center)
            .textContentType(.emailAddress)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.black, lineWidth: 1)
            )
            .padding(.top, 8)
    }
    
    var passwordSection: some View {
        VStack {
            SecureField("Password", text: $viewModel.password)
                .font(LatoFont.regular.font(size: 16))
                .multilineTextAlignment(TextAlignment.center)
                .textContentType(.password)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding(.top, 8)
            SecureField("Confirm Password", text: $viewModel.passwordConfirmation)
                .font(LatoFont.regular.font(size: 16))
                .multilineTextAlignment(TextAlignment.center)
                .textContentType(.password)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.black, lineWidth: 1)
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
    }
}

#Preview {
    SignupView(viewModel: SignupViewModel())
}
