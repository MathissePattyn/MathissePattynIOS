//
//  ContentView.swift
//  labo4
//
//  Created by Mathisse Pattyn on 14/10/2025.
//

import SwiftUI

struct ContentView: View {
    @State var gekozenTeam = ""
    @State var landen : [String] = ["Belgie", "Nederland"]
    
    var body: some View {
        VStack{
            List{
                ForEach(landen, id: \.self){ land in Text(land)
                    	
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
