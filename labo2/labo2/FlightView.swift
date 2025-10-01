//
//  DepartureView.swift
//  labo2
//
//  Created by Mathisse Pattyn on 30/09/2025.
//

import SwiftUI

struct FlightView: View {
    let flightInfo : FlightInfo
       
    var body: some View {
        VStack{
            
            Grid{
                GridRow{
                    Text(flightInfo.FlightInfo.cityDepAfk)
                    Text("")
                    Text(flightInfo.FlightInfo.arrCityAfk)
                }
                .font(.largeTitle)
                .foregroundStyle(Color.green)
                GridRow{
                    Text(flightInfo.FlightInfo.cityDep)
                    Image(systemName: "airplane")
                    Text(flightInfo.FlightInfo.arrCity)
                }
                GridRow{
                    Text(flightInfo.FlightInfo.depTime)
                    Text("")
                    Text(flightInfo.FlightInfo.arrTime)
                }
            }
            
            
            Grid{
                GridRow{
                    Text("flight").bold()
                    Text("gate").bold()
                    Text("seat").bold()
                }
                Divider()
                GridRow{
                    Text(flightInfo.FlightInfo.flight)
                    Text(flightInfo.FlightInfo.gate)
                    Text(flightInfo.FlightInfo.seat)
                }
            }
            .background(Color.green)
            .padding()
            .foregroundStyle(Color.white)
            .cornerRadius(10)
            
            
            HStack{
                VStack{
                    Text("Passenger")
                    Text(flightInfo.FlightInfo.passenger)

                    
                    Text("Class")
                    Text(flightInfo.FlightInfo.class)
                    Text("Flight date")
                    Text(flightInfo.FlightInfo.flightDate)
                }
                Image(systemName: "person.crop.square")
                    .resizable()
                    .frame(width: 100, height: 200)
                
            }
        }
        
        Spacer()
    }
}

#Preview {
    FlightView(flightInfo: FlightInfo(FlightInfo: ("BRU", "Brussels", "8:15", "BCN", "Barcelona", "11:15", "SN23A", "B23", "27A", "Dirk Hostens", "Business", "1/09/2024")))
                
}
