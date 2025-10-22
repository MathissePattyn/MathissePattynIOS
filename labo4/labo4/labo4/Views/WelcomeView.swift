//
//  WelcomeView.swift
//  labo4
//
//  Created by Mathisse Pattyn on 15/10/2025.
//

import SwiftUI

struct WelcomeView: View {
    @Environment(WKDataStore.self) var dataStore
    @State var gekozenTeam: String?
    
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "soccerball")
                Text("WK QATAR 2020")
                Image(systemName: "soccerball")
            }
                .font(Font.largeTitle.bold())
            
            

            List(dataStore.getAllTeams(), id:\.self, selection: $gekozenTeam){
                team in Text(team)
                    .foregroundColor(team == gekozenTeam ? .red : .primary)
            }
            Spacer()
            
            if let gekozenTeam = gekozenTeam{
                    NavigationLink("Next", destination: ResultsView(selectedTeam: gekozenTeam, gekozenTeam: $gekozenTeam))
                }
            
            
        }
    }
}






