//
//  ActorView.swift
//  labo6
//
//  Created by Mathisse Pattyn on 19/11/2025.
//

import SwiftUI

struct ActorView: View {
    var actor: Actor
    @Environment(PathStore.self) var pathStore
    @Environment(MovieDataStore.self) var movieDataStore
    
    var body: some View {
        VStack{
            Text("Actor: " + actor.firstName + " " + actor.lastName)
                .font(Font.largeTitle)
                .foregroundStyle(Color.red)
            Divider()
            VStack{
                Text("Birthday: " + actor.birthday)
            }
            Divider()
            VStack{
                Text("Movie(s):")
                List(movieDataStore.getMovies(actor: actor), id: \.self){movie in NavigationLink(value: Route.movie(movie)){
                    Text(movie.title)
                }
                }
            }
            Divider()
            NavigationStackView()
        }
    }
}


