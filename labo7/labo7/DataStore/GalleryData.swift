//
//  GalleryData.swift
//  labo7
//
//  Created by Mathisse Pattyn on 03/12/2025.
//

import Foundation

@Observable
class GalleryData{
    
    var galleries = [Gallery]()
    
    
    init(){
        
    }
    
    func getAllGalleries () -> [Gallery]{
        return galleries
    }
    
    func sort(){
        galleries.sort(by: {$0.id < $1.id})
    }
    
    func getArtistsFromGallery(gallery: Gallery) -> [Artist]{
        return gallery.artists.sorted(by: {$0.name < $1.name})
    }
    
    func getArtworksFromArtist(artist : Artist) -> [Artwork]{
        let artists = galleries.flatMap{$0.artists}
        let artist = artists.filter{$0.id == artist.id}
        let artworks = artist.flatMap({$0.artworks})
        return artworks.sorted(by: {$0.title < $1.title})
    }
    
    func getArtistFromArtwork(artwork : Artwork) -> [Artist]{
        let artists = galleries.flatMap{$0.artists}
        let filtered = artists.filter({$0.artworks.contains(artwork)})
        return filtered
    }
    
    func getArtworksFromArtist(artwork: Artwork) -> [Artwork]{
        let artist = getArtistFromArtwork(artwork: artwork).first
        let artworks = artist.flatMap{$0.artworks}
        return artworks!.sorted(by: {$0.title < $1.title})
        
    }
    
    func loadData() async {
            // TODO: Implement async loading
            do {
                print("⏳ Simulating 2-second load delay...")
                try await Task.sleep(for: .seconds(2)) // Simulate long load
                //load galleries here
                let root : Galleries = load("galleries.json")
                galleries = root.galleries
                sort()
                print("✅ Data loaded successfully.")
            } catch {
                print("❌ Failed to load galleries:", error)
                galleries = []
            }
        }
    
}
