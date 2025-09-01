//
//  UserDetailListItemView.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/4/24.
//

import SwiftUI

struct UserDetailListItemView: View {
    var imageName: String
    var title: String
    var content: String
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 10, height: 10)
                    .padding(5)
                    .background(Color.gray)
                    .clipShape(Circle())
                Text(title)
                    .font(LatoFont.hairline.font(size: 12))
                    .foregroundStyle(Color.onWhite)
                Spacer()
            }
            Text(content)
                .font(LatoFont.medium.font(size: 16))
                .padding(.leading, 28)
                .foregroundStyle(Color.onWhite)
        }
        .padding()
    }
}
