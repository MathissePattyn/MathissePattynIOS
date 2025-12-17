//
//  ContentView.swift
//  ProefExamen
//
//  Created by Mathisse Pattyn on 17/12/2025.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(DataManager.self) var dataManager
    @Environment(PathStore.self) var pathStore
    @State var loading = true
    
    var body: some View {
        if loading {
            ProgressView("Loading...")
                .task {
                    await dataManager.loadCars()
                    loading = false
                }
        } else{
            TabView{
                Tab("Home", systemImage: "photo.on.rectangle"){
                    HomeView()
                }
                Tab("Favorites",systemImage: "photo.on.rectangle"){
                    FavoritesView()
                }
                Tab("Settings", systemImage: "photo.on.rectangle"){
                    SettingsView()
                }
            }
        }
    }
}

