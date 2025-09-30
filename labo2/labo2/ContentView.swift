//
//  ContentView.swift
//  labo2
//
//  Created by Mathisse Pattyn on 30/09/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab("Departure", systemImage: "airplane.departure") {
                FlightView()
                //departureData tussen de haakjes
            }
            Tab("Info", systemImage: "info.bubble.fill.rtl") {
                HomeView()
            }
            Tab("Arrival", systemImage: "airplane.arrival") {
                FlightView()
                //arrivalData
            }
        }
    }
}

#Preview {
    ContentView()
}
