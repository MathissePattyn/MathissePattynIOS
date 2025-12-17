//
//  ContentView.swift
//  Labo7_2
//
//  Created by Mathisse Pattyn on 10/12/2025.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(GalleryData.self) var galleryData : GalleryData
    @State var loading = true
    @State var selectedGallery : Gallery? = nil
    
    var body: some View {
        
        if loading{
            ProgressView("Loading...")
                .task {
                    await galleryData.loadData()
                    loading = false
                }
        } else{
            TabView{
                Tab("Galleries", systemImage: "photo.on.rectangle"){
                    GalleriesView(gallery: $selectedGallery)
                }
                Tab("\(selectedGallery?.name ?? "No selected gallery")",systemImage: "photo.on.rectangle"){
                    GalleryDetailView(gallery: selectedGallery)
                }
            }
        }
        
    }
}

