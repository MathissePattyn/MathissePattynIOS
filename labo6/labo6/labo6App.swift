//
//  labo6App.swift
//  labo6
//
//  Created by Mathisse Pattyn on 18/11/2025.
//

import SwiftUI

@main
struct labo6App: App {
    @State var movieDataStore = MovieDataStore()
    @State var pathStore = PathStore();
    var body: some Scene {
        WindowGroup {
            ContentView().environment(movieDataStore).environment(pathStore)
        }
    }
}
