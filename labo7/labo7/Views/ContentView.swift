//
//  ContentView.swift
//  labo7
//
//  Created by Mathisse Pattyn on 03/12/2025.
//

import SwiftUI

struct ContentView: View {

    @State var selectedGallery : Gallery? = nil
    
    var body: some View {
        TabView(){
            Tab("Galeries", systemImage: "photo.on.rectangle"){
                GalleriesView(selectedGallery: $selectedGallery)
            }
            Tab("\(selectedGallery?.name ?? "No galleries")", systemImage: "photo.on.rectangle"){
                GalleryDetailView(gallery: selectedGallery)
            }
        }
    }
}



