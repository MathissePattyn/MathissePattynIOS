//
//  WelcomeView.swift
//  labo4
//
//  Created by Mathisse Pattyn on 15/10/2025.
//

import SwiftUI

struct WelcomeView: View {
    @State var gekozenTeam = ""
    @EnvironmentObject var dataStore : WKDataStore
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "soccerball")
                Text("WK QATAR 2020")
                Image(systemName: "soccerball")
            }
                .font(Font.largeTitle.bold())
            
            
            Text("Select your favourite team...")
            List{
                ForEach(dataStore.getAllTeams(), id: \.self){ land in
                    Button("\(land)"){
                        gekozenTeam = land
                    }
                    .listRowBackground(gekozenTeam == land ? Color.blue : Color.clear)
                    .foregroundColor(Color.black)
                }
                
            }
            Spacer()
            
            if !gekozenTeam.isEmpty {
                NavigationLink(destination: ResultsView(selectedTeam: gekozenTeam)) {
                    Text("NEXT")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
//            if(gekozenTeam != ""){
//                Button("NEXT"){
//                    NavigationStack {
//                        NavigationLink("Start", destination: WelcomeView())
//                            .navigationTitle("Welkom")
//                    }
//                }
//                
//            }
        }
    }
}


#Preview {
//    ContentView()
//        .environmentObject(WKDataStore())
    WelcomeView()
        .environmentObject(WKDataStore())
}



