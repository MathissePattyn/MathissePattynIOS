//
//  MovieDataStore.swift
//  Movies
//
//  Created by Dirk Hostens on 04/12/2023.
//

import Foundation

@Observable
class MovieDataStore {
    private var movies = Movies()
    
    init(){

       
    }
    
    func getMovies() -> [Movie] {
        return movies.movies;
    }
    
    func getMovies(actor: Actor) -> [Movie] {
        return movies.movies.filter{movie in movie.actors.contains(actor)}
    }
    
    func getMovies(director: Director) -> [Movie] {
        return movies.movies.filter{movie in movie.director == director}
    }
    
    func getACtors(director: Director) -> [Actor] {
        let filteredMovies = getMovies(director: director)
        let actors = filteredMovies.flatMap{$0.actors}
        return Array(Set(actors))
    }
    
    private func sort() {
        movies.movies.sort{$0.title < $1.title}
    }
    
    func loadData() async {
        //simulate async call
        do {
            print("⏳ Simulating 2-second load delay...")
            try await Task.sleep(for: .seconds(2)) // Simulate long load
            // load movies
             movies = load("movies.json")
            // sort
            sort();
            print("✅ Data loaded successfully.")
            
        } catch {
            print("❌ Failed to load movies:", error)
            //movies is lege array
            movies = Movies()
        }
    }
}
