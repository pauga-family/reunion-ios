//
//  ModifyEventView.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/23/25.
//

import SwiftUI
import MapKit

struct ModifyEventView: View {
    @ObservedObject var viewModel: ModifyEventViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            ScrollView(showsIndicators: false) {
                nameField
                datePicker
                locationPicker
                    .padding()
                detailsField
            }
            .navigationTitle(viewModel.headerText)
            .padding()
            submitButton
        }
        .padding(.top)
        .alert(isPresented: $viewModel.isShowingError) {
            Alert(title: Text(viewModel.alertTitle),
                  message: errorText as? Text,
                  dismissButton: .default(Text(viewModel.alertButtonText)) {
                viewModel.alertDismissed()
            })
        }
    }
}

private extension ModifyEventView {
    var titleHeader: some View {
        Text(viewModel.headerText)
            .font(LatoFont.bold.font(size: 24))
            .fontWeight(.bold)
    }
    
    var nameField: some View {
        TextField(viewModel.eventNamePlaceholder, text: $viewModel.eventName)
            .font(LatoFont.regular.font(size: 18))
    }
    
    var datePicker: some View {
        DatePicker(viewModel.eventDatePlaceholder, selection: $viewModel.eventDate)
            .font(LatoFont.regular.font(size: 18))
    }
    
    var locationPicker: some View {
        VStack {
            Text(viewModel.eventLocationPlaceholder)
                .font(LatoFont.regular.font(size: 18))
            Map()
                .frame(height: 300)
        }
    }
    
    var detailsField: some View {
        VStack {
            Text(viewModel.eventDetailsPlaceholder)
                .font(LatoFont.regular.font(size: 18))
            TextEditor(text: $viewModel.eventDetails)
                .padding()
                .border(Color.gray, width: 1)
                .frame(height: 200)
                .font(LatoFont.regular.font(size: 16))
        }
    }
    
    var submitButton: some View {
        Button {
            viewModel.submitButtonTapped()
        } label: {
            Text(viewModel.submitButtonText)
                .font(LatoFont.regular.font(size: 16))
                .padding()
        }
        .foregroundColor(Color.onColor)
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(gradient: Gradients.secondaryToTertiary.gradient, startPoint: .leading, endPoint: .trailing)
        )
        .clipShape(Capsule())
        .padding(.horizontal, 20)
    }
    
    var errorText: some View {
        Text(viewModel.errorMessages.joined(separator: "\n"))
    }
}

#Preview {
    ModifyEventView(viewModel: ModifyEventViewModel(event: nil))
}
