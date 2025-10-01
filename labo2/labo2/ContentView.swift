//
//  ContentView.swift
//  labo2
//
//  Created by Mathisse Pattyn on 30/09/2025.
//

import SwiftUI

struct ContentView: View {
       
    let departureData = FlightInfo(FlightInfo: ("BRU", "Brussels", "8:15", "BCN", "Barcelona", "11:15", "SN23A", "B23", "27A", "Dirk Hostens", "Business", "1/09/2024"))
    let arrivalData = FlightInfo(FlightInfo: ("BCN", "Barcelona", "13:05", "BRU", "Brussels", "15:15", "SN205", "XD-30", "17C", "Dirk Hostens", "Business", "1/09/2024"))

    var body: some View {
        TabView{
            Tab("Departure", systemImage: "airplane.departure") {
                FlightView(flightInfo: departureData)
                //departureData tussen de haakjes
            }
            Tab("Info", systemImage: "info.bubble.fill.rtl") {
                HomeView()
            }
            Tab("Arrival", systemImage: "airplane.arrival") {
                FlightView(flightInfo: arrivalData)
                //arrivalData
            }
        }
    }
}

#Preview {
    ContentView()
}
