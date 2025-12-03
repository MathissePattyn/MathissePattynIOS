//
//  GalleriesView.swift
//  labo7
//
//  Created by Mathisse Pattyn on 03/12/2025.
//

import SwiftUI

struct GalleriesView: View {
    @Environment(GalleryData.self) var galleryData
    @State var loading = true
    
    var body: some View {
        
        if loading{
            ProgressView("Loading...")
                .task {
                    await galleryData.loadData()
                    loading = false
                }
        } else{
            List()
        }
    }
}

#Preview {
    GalleriesView()
}
