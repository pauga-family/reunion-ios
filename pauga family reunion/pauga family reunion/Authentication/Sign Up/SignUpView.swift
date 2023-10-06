//
//  SignUpView.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 9/17/23.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel: SignUpViewModel
    var body: some View {
        VStack {
            headerTitle
            Spacer()
            VStack(spacing: 20) {
                firstNameSection
                lastNameSection
                emailSection
                passwordSection
                verifyPasswordSection
            }
            .padding()
            Spacer()
            submitButton
        }
        .padding()
    }
}

private extension SignUpView {
    var headerTitle: some View {
        Text("Pauga Family Reunion")
            .font(.largeTitle)
            .fontWeight(.bold)
    }
    
    var firstNameSection: some View {
        VStack {
            TextField("First Name", text: $viewModel.firstName)
                .multilineTextAlignment(TextAlignment.center)
                .textContentType(.name)
                .textFieldStyle(.roundedBorder)
        }
    }
    
    var lastNameSection: some View {
        VStack {
            TextField("Last Name", text: $viewModel.lastName)
                .multilineTextAlignment(TextAlignment.center)
                .textContentType(.name)
                .textFieldStyle(.roundedBorder)
        }
    }
    
    var emailSection: some View {
        VStack {
            TextField("Email", text: $viewModel.email)
                .multilineTextAlignment(TextAlignment.center)
                .textContentType(.emailAddress)
                .textFieldStyle(.roundedBorder)
        }
    }
    
    var passwordSection: some View {
        VStack {
            TextField("Password", text: $viewModel.password)
                .multilineTextAlignment(TextAlignment.center)
                .textContentType(.newPassword)
                .textFieldStyle(.roundedBorder)
        }
    }
    
    var verifyPasswordSection: some View {
        VStack {
            TextField("Verify Password", text: $viewModel.verifyPassword)
                .multilineTextAlignment(TextAlignment.center)
                .textContentType(.newPassword)
                .textFieldStyle(.roundedBorder)
        }
    }
    
    var submitButton: some View {
        Button {
            print("Submit tapped")
        } label: {
            Text("Submit")
                .padding()
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .background(Color.blue)
        .clipShape(Capsule())
        .padding()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: SignUpViewModel())
    }
}
