//
//  ListStadionView.swift
//  labo4
//
//  Created by Mathisse Pattyn on 22/10/2025.
//

import SwiftUI


struct ListStadionView: View {
    
    let selectedTeam : String
    @Environment(WKDataStore.self) var dataStore
    @Binding var gekozenStadion : String?
    
    
    var body: some View {
        List(dataStore.getAllStadionsOfAllTeams(), id: \.self, selection: $gekozenStadion){
            stadion in Text(stadion)
        }
        .listStyle(.sidebar)
    }
}

