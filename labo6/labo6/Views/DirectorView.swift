//
//  DirectorView.swift
//  labo6
//
//  Created by Mathisse Pattyn on 19/11/2025.
//

import SwiftUI

struct DirectorView: View {
    @Environment(PathStore.self) var pathStore
    @Environment(MovieDataStore.self) var movieDataStore
    var director : Director
    
    @State var selectedMovie : Movie?
    @State var selectedActor : Actor?
    
    var body: some View {
        VStack{
            Text("Director: " + director.firstName + " " + director.lastName)
            Divider()
            VStack{
                Text("Movie(s)")
                List(movieDataStore.getMovies(director: director), id: \.self, selection: $selectedMovie){ movie in
                    NavigationLink(value: Route.movie(movie)){
                        Text(movie.title)
                    }
                }
            }
            Divider()
            VStack{
                Text("Actors work with: ")
                List(movieDataStore.getACtors(director: director), id: \.self, selection: $selectedActor){ actor in
                    NavigationLink(value: Route.actor(actor)){
                        Text(actor.firstName + " " + actor.lastName)
                    }
                }
            }
            Divider()
            NavigationStackView()
        }
    }
}


