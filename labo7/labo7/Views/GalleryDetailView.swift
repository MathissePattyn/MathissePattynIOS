//
//  GalleryDetailView.swift
//  labo7
//
//  Created by Mathisse Pattyn on 03/12/2025.
//

import SwiftUI

struct GalleryDetailView: View {
    
    @Environment(GalleryData.self) var galleryData
    @Environment(PathStore.self) var pathStore
    
    var gallery : Gallery?
    
    var body: some View {
        @Bindable var pathStore = pathStore
        
        NavigationStack(path: $pathStore.path){
        if let gallery = gallery{
            VStack{
                Text(gallery.name)
                    .font(Font.largeTitle)
                    .foregroundStyle(Color.brown)
                Divider()
                    .frame(minHeight: 3)
                    .overlay(Color.brown)
                VStack{
                    Text(gallery.location)
                        .bold()
                    Text(gallery.description)
                        .foregroundStyle(Color.gray)
                }
                Divider()
                    .frame(minHeight: 3)
                    .overlay(Color.brown)
                    VStack{
                        Text("List of artists")
                        List(galleryData.getArtistsFromGallery(gallery: gallery), id: \.self){
                            artist in NavigationLink(value: Destination.artist(artist)){
                                VStack{
                                    Text(artist.name)
                                        .bold()
                                        .foregroundStyle(Color.brown)
                                    Text(artist.nationality)
                                        .foregroundStyle(Color.gray)
                                }
                            }
                        }
                    }
                }
            .navigationDestination(for: Destination.self){
                destination in
                switch destination{
                case .artist(let artist):
                    ArtistDetailView(artist: artist)
                case .artwork(let artwork):
                    ArtworkDetailView(artwork: artwork)
                case .gallery(let gallery):
                    GalleryDetailView(gallery: gallery)
                }
            }
            }else{
                Text("No gallery selected")
            }
            
        }
    }
}

