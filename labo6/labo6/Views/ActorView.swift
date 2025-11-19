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
            List(movieDataStore.getMovies(actor: actor), id: \.self){movie in
                VStack{
                    Text(movie.title)
                }
            }
        }
    }
}


