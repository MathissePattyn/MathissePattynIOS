//
//  labo4App.swift
//  labo4
//
//  Created by Mathisse Pattyn on 14/10/2025.
//

import SwiftUI

@main
struct labo4App: App {
    @State var dataScore = WKDataStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(dataScore)
        }
    }
}
