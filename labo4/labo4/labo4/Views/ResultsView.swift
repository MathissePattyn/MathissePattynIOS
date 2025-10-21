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
    
    var body: some View {
        
        NavigationSplitView{
            //Toon de stadiums van het geselecteerde land
            List(dataStore.getAllStadionsOfAllTeams(), id: \.self, selection: $gekozenStadion){
                stadion in Text(stadion)
            }
            .navigationTitle("Alle Stadions")
                   } detail: {
                       // Detail shows the selected stadion or a placeholder text
                       if let stadion = gekozenStadion {
                           Text("Gekozen stadion: \(stadion)")
                               .font(.largeTitle)
                               .padding()
                       } else {
                           Text("Selecteer een stadion")
                               .foregroundColor(.secondary)
                       }
                   }
//        }
        
    }
}

