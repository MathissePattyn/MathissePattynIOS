//
//  GalleriesView.swift
//  Labo7_2
//
//  Created by Mathisse Pattyn on 10/12/2025.
//

import SwiftUI

struct GalleriesView: View {
    
    @Environment(GalleryData.self) var galleryData : GalleryData
    
    @Binding var gallery : Gallery?
    
    var body: some View {
        List(galleryData.getGalleries(), id: \.self, selection: $gallery){
            gallery in
            VStack{
                Text(gallery.name)
                    .font(Font.largeTitle.bold())
                    .foregroundStyle(Color.brown)
                Text(gallery.location)
                    .bold()
                Text(gallery.description)
                    .foregroundStyle(Color.gray)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
        }
    }
}

