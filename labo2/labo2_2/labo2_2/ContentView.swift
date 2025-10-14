//
//  ContentView.swift
//  labo2_2
//
//  Created by Mathisse Pattyn on 14/10/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        TabView{
            Tab("departure", systemImage: "airplane.departure"){
                
            }
            Tab("Info", systemImage: "info.bubble.fill"){
                
            }
            Tab("Arrival", systemImage: "airplane.arrival"){
                
            }
        }
    }
}

#Preview {
    ContentView()
}
