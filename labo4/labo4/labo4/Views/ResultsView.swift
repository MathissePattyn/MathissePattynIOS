//
//  ResultsView.swift
//  labo4
//
//  Created by Mathisse Pattyn on 15/10/2025.
//

import SwiftUI

struct ResultsView: View {
    let selectedTeam : String
    @Environment(WKDataStore.self) var dataStore
    @State var gekozenStadion : String?
    @State var gekozenMatch : WKResult?
    let gekozenTeam : String
    
    var body: some View {
        
        NavigationSplitView{
            //Toon de stadiums van het geselecteerde land
            ListStadionView(selectedTeam: selectedTeam, gekozenStadion: $gekozenStadion)
            .navigationTitle("Alle Stadions")
                   } detail: {
                       ScoreListView(gekozenStadion: $gekozenStadion, gekozenMatch: $gekozenMatch, gekozenTeam: gekozenTeam)
                   }
    }
}

