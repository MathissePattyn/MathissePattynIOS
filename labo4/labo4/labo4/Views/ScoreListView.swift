//
//  ScoreListView.swift
//  labo4
//
//  Created by Mathisse Pattyn on 22/10/2025.
//

import SwiftUI

struct ScoreListView: View {
    @Environment(WKDataStore.self) var dataStore
    @Binding var gekozenStadion : String?
    @Binding var gekozenMatch : WKResult?
    @Binding var gekozenTeam: String?

    
    var body: some View {
        NavigationSplitView{
            if let stadion = gekozenStadion, let gekozenTeam = gekozenTeam {
                List(dataStore.getAllResultsByLocation(stadion: stadion), id: \.self, selection: $gekozenMatch){
                    match in
                    Grid{
                        GridRow{
                            if(gekozenTeam == match.homeTeam){
                                Text("\(match.homeTeam)")
                                    .foregroundStyle(Color.red)
                            } else{
                                Text("\(match.homeTeam)")
                            }
                            Text("X")
                            
                            Text("\(match.awayTeam)")
                        }
                        if let homeScore = match.homeTeamScore, let awayScore = match.awayTeamScore {
                            GridRow{
                                Text("\(homeScore)")
                                
                                Text("-")
                                
                                Text("\(awayScore)")
                            }
                        }
                        
                    }
                    Divider()
                }
                
                
            } else {
                Text("Selecteer een stadion")
                    .foregroundColor(.secondary)
            }
        } detail: {
            if let match = gekozenMatch {
                DetailGameView(gekozenMatch: $gekozenMatch, gekozenStadion: $gekozenStadion)
            } else{
                EmptyView()
            }
        }
    }
}
