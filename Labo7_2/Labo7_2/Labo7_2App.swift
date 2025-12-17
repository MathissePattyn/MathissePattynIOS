//
//  Labo7_2App.swift
//  Labo7_2
//
//  Created by Mathisse Pattyn on 10/12/2025.
//

import SwiftUI

@main
struct Labo7_2App: App {
    
    @State var galleryData = GalleryData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(galleryData)
        }
    }
}
