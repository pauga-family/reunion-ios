//
//  UserDetailView.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/3/24.
//

import Foundation
import SwiftUI

struct UserDetailView : View {
    var user: UserModel
    
    var body: some View {
        VStack {
            headerView
            detailView
        }
        .background(Color.primary)
    }
}

// Private view code
private extension UserDetailView {
    var iconView: some View {
        Image(systemName: "person")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 30, height: 30)
            .padding()
            .background(Color.secondary)
            .clipShape(Circle())
    }
    
    var nameView: some View {
        VStack(alignment: .center) {
            Text("\(user.firstName) \(user.lastName)")
                .font(LatoFont.regular.font(size: 20))
                .foregroundStyle(Color.onColor)
            if let location = user.location {
                Text(location)
                    .font(.caption)
                    .foregroundStyle(Color.onColor)
            }
        }
        .padding(.leading, 8)
    }
    
    var headerView: some View {
        HStack {
            iconView
                .padding(.leading, 16)
                .padding(.top, 24)
                .padding(.bottom, 12)
            nameView
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.primary)
    }
    
    var aboutSectionView: some View {
        VStack {
            HStack {
                Image(systemName: "info.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 10, height: 10)
                    .padding(5)
                    .background(Color.gray)
                    .clipShape(Circle())
                Text("Biography")
                    .font(LatoFont.hairline.font(size: 12))
                    .foregroundStyle(Color.onWhite)
                Spacer()
            }
            Text(user.biography ?? "No biography available.")
                .font(LatoFont.medium.font(size: 16))
                .padding(.leading, 28)
                .padding(.top, 8)
                .foregroundStyle(Color.onWhite)
        }
        .padding()
    }
    
    var detailView: some View {
        VStack {
            VStack {
                UserDetailListItemView(imageName: "envelope.front", title: "Email", content: user.email)
                Divider()
                UserDetailListItemView(imageName: "arcade.stick", title: "Titles", content: user.title ?? "None listed")
                Divider()
                aboutSectionView
            }
            .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .shadow(radius: 10)
        .ignoresSafeArea(.all)
    }
}
