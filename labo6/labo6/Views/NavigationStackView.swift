//
//  NavigationStackView.swift
//  labo6
//
//  Created by Mathisse Pattyn on 02/12/2025.
//

import SwiftUI

struct NavigationStackView: View {
    
    @Environment(PathStore.self) var pathStore
    @Environment(MovieDataStore.self) var movieDataStore
    
    var body: some View {
        VStack{
            Text("NavigationStack")
                .font(Font.largeTitle.bold())
            ForEach(Array(pathStore.path.enumerated()), id: \.offset){ index, route in
                switch route{
                case let .movie(m):
                    Text("Movie: \(m.title)" )
                case let .actor(a):
                    Text("Actor: \(a.firstName) \(a.lastName)")
                case let .director(d):
                    Text("Director: \(d.firstName) \(d.lastName)")
                }
            }
            
            Button("Clear"){
                pathStore.path = []
            }
        }
    }
}
