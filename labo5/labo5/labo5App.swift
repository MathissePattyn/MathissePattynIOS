//
//  labo5App.swift
//  labo5
//
//  Created by Mathisse Pattyn on 04/11/2025.
//

import SwiftUI

@main
struct labo5App: App {
    @State var dataStore = UurroosterDataStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(dataStore)
        }
    }
}
