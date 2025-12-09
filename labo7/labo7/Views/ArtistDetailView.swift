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
            VStack{
                Text(artist.nationality)
                Text(artist.style)
                    .bold()
                Text(artist.description)
                    .foregroundStyle(Color.gray)
            }
            VStack{
                Text("List of art")
                List(
            }
        }
    }
}

