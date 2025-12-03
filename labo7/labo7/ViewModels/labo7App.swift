//
//  labo7App.swift
//  labo7
//
//  Created by Mathisse Pattyn on 03/12/2025.
//

import SwiftUI

@main
struct labo7App: App {

    @State var galleryData = GalleryData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(galleryData)
        }
    }
}
