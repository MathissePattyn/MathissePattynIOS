//
//  ContentView.swift
//  labo4
//
//  Created by Mathisse Pattyn on 14/10/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Start", destination: WelcomeView())
                .navigationTitle("Welkom")
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(WKDataStore())
}




