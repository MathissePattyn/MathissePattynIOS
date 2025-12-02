//
//  MovieView.swift
//  labo6
//
//  Created by Mathisse Pattyn on 02/12/2025.
//

import SwiftUI

struct MovieView: View {
    var movie: Movie
    @Environment(PathStore.self) var pathStore
    @Environment(MovieDataStore.self) var movieDataStore
    
    @State var selectedActor: Actor?
    
    var body: some View {
        VStack{
            Text(movie.title)
                .font(Font.largeTitle)
                .foregroundStyle(Color.red)
            Text(movie.description)
            Divider()
            VStack{
                Text("Actors")
                List(movie.actors.sorted(by: {$0.firstName < $1.firstName}), id: \.self, selection: $selectedActor){
                    actor in NavigationLink(value: Route.actor(actor)){
                        Text(actor.firstName + " " + actor.lastName)
                    }
                }
            }
            Divider()
            VStack{
                Text("Directors")
                NavigationLink(value: Route.director(movie.director)){
                    Text(movie.director.firstName + " " + movie.director.lastName)
                }
            }
            Divider()
            NavigationStackView()
        }
    }
}
