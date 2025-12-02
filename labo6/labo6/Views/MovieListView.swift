import SwiftUI

struct MovieListView: View {
    @Environment(PathStore.self) var pathStore
    @Environment(MovieDataStore.self) var movieDataStore
    
    @State var loading = true
    @State var selectedEvent : Movie?
    
    var body: some View {
        @Bindable var pathStore = pathStore
        
        NavigationStack(path: $pathStore.path) {
            
            if loading {
                ProgressView("Loading movies...")
                    .task {
                        await movieDataStore.loadData()
                        loading = false
                    }
            } else {
                List(movieDataStore.getMovies(), id: \.self, selection: $selectedEvent) { movie in
                    NavigationLink(value: Route.movie(movie)){
                        VStack(alignment: .leading) {
                            Text(movie.title)
                            Text(movie.description)
                        }
                    }
                }
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case let .actor(actor):
                        ActorView(actor: actor)
                        
                    case let .director(director):
                        DirectorView(director: director)
                    case let .movie(movie):
                        MovieView(movie : movie)
                    }
                }
            }
        }
       
    }
}
