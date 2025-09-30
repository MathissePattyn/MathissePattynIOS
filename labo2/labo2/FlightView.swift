//
//  DepartureView.swift
//  labo2
//
//  Created by Mathisse Pattyn on 30/09/2025.
//

import SwiftUI

struct FlightView: View {
    var body: some View {
        
        Grid{
            GridRow{
                Text("BRU")
                Text("")
                Text("BCN")
            }
            GridRow{
                Text("Brussels")
                Image(systemName: "airplane")
                Text("Barcelona")
            }
            GridRow{
                Text("8:15")
                Text("")
                Text("11:15")
            }
            
            HStack{
                
            }
            Spacer()
        }
        
        
        
    }
}

#Preview {
    FlightView()
}
