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
            //Spacer()
            emailField
        }
        .padding()
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
        TextField("Email Address", text: $viewModel.userName)
            .font(LatoFont.bold.font(size: 16))
            .foregroundColor(.onColor)
            .overlay(
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .stroke(Color.black, lineWidth: 1)
            )
            .padding()
            
    }
}

#Preview {
    SignInView(viewModel: SignInViewModel())
}
