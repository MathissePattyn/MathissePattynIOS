//
//  ArtworkDetailView.swift
//  labo7
//
//  Created by Mathisse Pattyn on 09/12/2025.
//

import SwiftUI

struct ArtworkDetailView: View {
    
    @Environment(GalleryData.self) var galleryData
    @Environment(PathStore.self) var pathStore
    
    var artwork : Artwork
    
    var body: some View {
        VStack{
            Text(artwork.title)
                .font(Font.largeTitle)
                .foregroundStyle(Color.brown)
            Divider()
                .frame(minHeight: 3)
                .overlay(Color.brown)
            VStack{
                Text(artwork.medium)
                Text(artwork.dimensions)
                    .bold()
                Text(artwork.description)
            }
            Divider()
                .frame(minHeight: 2)
                .overlay(Color.brown)
            HStack{
                Text("artist: ")
                NavigationLink(value: Destination.artist(galleryData.getArtistFromArtwork(artwork: artwork).first!)){
                    Text("\(galleryData.getArtistFromArtwork(artwork: artwork).first!.name)")
                }
            }
            Divider()
                .frame(minHeight: 2)
                .overlay(Color.brown)
            VStack{
                Text("List of other art")
                List(galleryData.getArtworksFromArtist(artwork: artwork), id:\.self){
                    artwork in NavigationLink(value: Destination.artwork(artwork)){
                        VStack{
                            Text(artwork.title)
                                .bold()
                                .foregroundStyle(Color.brown)
                            Text(artwork.description)
                                .lineLimit(1)
                                .truncationMode(.tail)
                        }
                    }
                }
            }
        }
    }
}

