//
//  ProefExamenApp.swift
//  ProefExamen
//
//  Created by Mathisse Pattyn on 17/12/2025.
//

import SwiftUI

@main
struct ProefExamenApp: App {
    
    @State var dataManager = DataManager()
    @State var pathStore = PathStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(dataManager).environment(pathStore)
        }
    }
}
