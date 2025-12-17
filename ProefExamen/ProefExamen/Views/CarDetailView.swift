//
//  CarDetailView.swift
//  ProefExamen
//
//  Created by Mathisse Pattyn on 17/12/2025.
//

import SwiftUI

struct CarDetailView: View {
    
    @Environment(DataManager.self) var dataManager
    var car : Car
    @State var isFavorieteAuto = false
    @State var filter = false
    
    
    var body: some View {
        Group{
            if filter{
                FilterView()
            } else{
                VStack{
                    Toggle("Favorite Auto", isOn: $isFavorieteAuto)
                    Text(car.brand)
                    Text(car.color)
                    Text(car.fuelType)
                    Text(car.model)
                    Text("\(car.price)")
                    Text("\(car.year)")
                    Button("Filter"){
                        filter = true
                    }
                }
                .onChange(of: isFavorieteAuto){
                    dataManager.toggleFavorite(car: car)
                }
            }
        }
       
    }
}
