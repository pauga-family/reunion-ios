//
//  View+Extensions.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/3/24.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
