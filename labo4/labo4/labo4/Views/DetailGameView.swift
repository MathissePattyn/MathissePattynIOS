//
//  DetailGameView.swift
//  labo4
//
//  Created by Mathisse Pattyn on 22/10/2025.
//

import SwiftUI

struct DetailGameView: View {
    @Environment(WKDataStore.self) var dataStore
    @Binding var gekozenMatch : WKResult?
    @Binding var gekozenStadion : String?
    
    var body: some View {
        if let match = gekozenMatch, let stadion = gekozenStadion {
            VStack{
                Text("\(match.dateUTC)")
                Text("")
                Text("\(stadion)")
                    .font(Font.largeTitle.bold())
                Divider()
                Grid{
                    GridRow{
                        Text("\(match.homeTeam)")
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
                Text("")
                Text("Round: \(match.roundNumber)")
                Text("")
                if let group = match.group {
                    Text("Group: \(group)")
                }
            }
        }
    
    }
}

