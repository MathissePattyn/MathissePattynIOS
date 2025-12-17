//
//  GalleryDetailView.swift
//  Labo7_2
//
//  Created by Mathisse Pattyn on 10/12/2025.
//

import SwiftUI

struct GalleryDetailView: View {
    var gallery : Gallery?
    
    var body: some View {
        if let gallery = gallery{
            VStack{
                Text(gallery.name)
                    .font(Font.largeTitle.bold())
                    .foregroundStyle(Color.brown)
            }
        } else {
            Text("Selecteer een gallery")
        }
    }
}

