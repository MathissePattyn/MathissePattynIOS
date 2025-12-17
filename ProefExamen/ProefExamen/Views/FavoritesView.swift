//
//  FavoritesView.swift
//  ProefExamen
//
//  Created by Mathisse Pattyn on 17/12/2025.
//

import SwiftUI

struct FavoritesView: View {
    
    @Environment(DataManager.self) var dataManager
    
    var body: some View {
        List(dataManager.getFavoriteCars(), id:\.self){
            car in
            VStack{
                Text(car.brand)
                Text(car.model)
                Button("Remove"){
                    
                }
            }
        }
    }
}

