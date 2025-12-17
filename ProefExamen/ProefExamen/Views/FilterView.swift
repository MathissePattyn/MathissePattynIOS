//
//  FilterView.swift
//  ProefExamen
//
//  Created by Mathisse Pattyn on 17/12/2025.
//

import SwiftUI

struct FilterView: View {
    @Environment(DataManager.self) var dataManager
    @State var geselecteerdeBrandstof : String = "Alle"
    
    let opties = ["Alle", "Benzine", "Elektrisch"]
    
    var body: some View {
        VStack{
            Picker("Brandstof", selection: $geselecteerdeBrandstof){
                ForEach(opties, id: \.self){ optie in
                    Text(optie)
                }
                
            }
                List(dataManager.getCarByFuelType(fueltype: geselecteerdeBrandstof), id: \.self){
                    car in
                    VStack{
                        Text(car.brand)
                        Text(car.model)
                    }
                }
            
        }
    }
}

