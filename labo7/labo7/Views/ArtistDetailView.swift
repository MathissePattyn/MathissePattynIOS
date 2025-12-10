//
//  ArtistDetailView.swift
//  labo7
//
//  Created by Mathisse Pattyn on 09/12/2025.
//

import SwiftUI

struct ArtistDetailView: View {
    
    @Environment(GalleryData.self) var galleryData
    @Environment(PathStore.self) var pathStore
    
    var artist : Artist
    
    var body: some View {
        VStack{
            Text(artist.name)
                .font(Font.largeTitle)
                .foregroundStyle(Color.brown)
            Divider()
                .frame(minHeight: 3)
                .overlay(Color.brown)
            VStack{
                Text(artist.nationality)
                Text(artist.style)
                    .bold()
                Text(artist.description)
                    .foregroundStyle(Color.gray)
            }
            Divider()
                .frame(minHeight: 3)
                .overlay(Color.brown)
            VStack{
                Text("List of art")
                List(galleryData.getArtworksFromArtist(artist: artist), id: \.self){
                    artwork in NavigationLink(value: Destination.artwork(artwork)){
                        VStack{
                            Text(artwork.title)
                                .bold()
                                .foregroundStyle(Color.brown)
                            Text(artwork.description)
                                .foregroundStyle(Color.gray)
                        }
                    }
                }
            }
        }
    }
}

