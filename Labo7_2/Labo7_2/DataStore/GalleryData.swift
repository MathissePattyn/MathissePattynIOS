//
//  GalleryData.swift
//  Labo7_2
//
//  Created by Mathisse Pattyn on 10/12/2025.
//

import Foundation

@Observable
class GalleryData {
    var galleries = [Gallery]()
    
    init() {
        
    }
    
    func getGalleries() -> [Gallery] {
        return galleries
    }
    
    func loadData() async{
        do{
            try await Task.sleep(for: .seconds(2))
            
            let root : Galleries = try load("galleries.json")
            galleries = root.galleries
        } catch{
            galleries = []
        }
    }
}
