//
//  ContentView.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 7/23/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AuthenticationRootView(viewModel: AuthenticationRootViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
