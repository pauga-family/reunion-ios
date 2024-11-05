//
//  DebugSettingsView.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 5/23/24.
//

import SwiftUI

struct DebugSettingsView: View {
    @ObservedObject var viewModel: DebugSettingsViewModel
    var body: some View {
        VStack {
            Text("Debug Settings")
                .font(LatoFont.bold.font(size: 24))
            Form {
                Text("Coming Soon")
            }
        }
    }
}

#Preview {
    DebugSettingsView(viewModel: DebugSettingsViewModel())
}
