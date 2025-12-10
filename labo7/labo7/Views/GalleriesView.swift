//
//  GalleriesView.swift
//  labo7
//
//  Created by Mathisse Pattyn on 03/12/2025.
//

import SwiftUI

struct GalleriesView: View {
    @Environment(GalleryData.self) var galleryData
    @Environment(PathStore.self) var pathStore
    @Binding var selectedGallery : Gallery?
    
    var body: some View {

                List(galleryData.getAllGalleries(), id: \.self, selection: $selectedGallery){
                    gallery in
                        VStack{
                            Text(gallery.name)
                                .font(Font.largeTitle.bold())
                                .foregroundStyle(Color.brown)
                            Text(gallery.location)
                            Text(gallery.description)
                                .foregroundStyle(Color.gray)
                                .lineLimit(1)
                                .truncationMode(.tail)
                            Divider()
                        
                    }
                }
            }
        }



