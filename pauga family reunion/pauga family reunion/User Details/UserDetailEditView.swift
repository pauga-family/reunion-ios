//
//  UserDetailView.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 5/6/24.
//

import SwiftUI

struct UserDetailEditView: View {
    @ObservedObject var viewModel: UserDetailEditViewModel
    @State var test: String = "Justin"
    var body: some View {
        VStack {
            ScrollView {
                iconView
                firstNameTextField
                lastNameTextField
                titleTextField
                emailTextField
                locationTextField
                biographyTextField
            }
            Spacer()
            if !viewModel.readOnly {
                saveButton
            }
        }
        .padding()
    }
}

private extension UserDetailEditView {
    var iconView: some View {
        Image(systemName: "person")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            .padding(.top, 40)
            .padding(.bottom, 50)
    }
    var firstNameTextField: some View {
        TextField("First name", text: $viewModel.firstName)
            .font(LatoFont.regular.font(size: 16))
            .disabled(viewModel.readOnly)
            .padding()
            .multilineTextAlignment(.center)
    }
    
    var lastNameTextField: some View {
        TextField("Last name", text: $viewModel.lastName)
            .font(LatoFont.regular.font(size: 16))
            .disabled(viewModel.readOnly)
            .padding()
            .multilineTextAlignment(.center)
    }
    
    var titleTextField: some View {
        TextField("Matai Title", text: $viewModel.title)
            .font(LatoFont.regular.font(size: 16))
            .disabled(viewModel.readOnly)
            .padding()
            .multilineTextAlignment(.center)
    }
    
    var emailTextField: some View {
        TextField("Email", text: $viewModel.email)
            .font(LatoFont.regular.font(size: 16))
            .disabled(viewModel.readOnly)
            .padding()
            .multilineTextAlignment(.center)
    }
    
    var locationTextField: some View {
        TextField("Location", text: $viewModel.location)
            .font(LatoFont.regular.font(size: 16))
            .disabled(viewModel.readOnly)
            .padding()
            .multilineTextAlignment(.center)
    }
    
    var biographyTextField: some View {
        VStack {
            Text("About me")
                .font(LatoFont.regular.font(size: 16))
                .padding(.bottom, 0)
            TextField("", text: $viewModel.biography, axis: .vertical)
                .disabled(viewModel.readOnly)
                .border(Color.black)
                .padding()
                .multilineTextAlignment(.center)
                .lineLimit(5...10)
        }
    }
    
    var saveButton: some View {
        Button(action: {
            print("Save tapped")
        }, label: {
            Text("Save")
                .font(LatoFont.regular.font(size: 16))
                .foregroundColor(Color.onColor)
                .padding()
        })
        .frame(maxWidth: .infinity)
        .background(LinearGradient(gradient: Gradients.secondaryToTertiary.gradient, startPoint: .leading, endPoint: .trailing))
        .clipShape(Capsule())
        .padding(.bottom, 20)
    }
}

#Preview {
    UserDetailEditView(viewModel: UserDetailEditViewModel(user: nil))
}
