//
//  HomeView.swift
//  ProefExamen
//
//  Created by Mathisse Pattyn on 17/12/2025.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(DataManager.self) var dataManager 
    @Environment(PathStore.self) var pathStore
    
    @State var selectedCar : Car?
    @State var filter = false
    
    @State var huidigeFilter = "Alle"
    
    var body: some View {
        @Bindable var pathStore = pathStore
        
        NavigationStack(path: $pathStore.path){
                List(dataManager.getAllCars(), id: \.self, selection: $selectedCar){
                    car in NavigationLink(value: Destination.carDetail(car)){
                        VStack{
                            Text(car.brand)
                            Text(car.model)
                            Text("\(car.price)")
                        }
                    }
                }
                .navigationDestination(for: Destination.self){
                    destination in switch destination{
                    case .carDetail(let car):
                        CarDetailView(car: car)
                    }
                }
            }
        }
    }

