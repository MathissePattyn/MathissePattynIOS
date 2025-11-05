//
//  UurroosterList.swift
//  labo5
//
//  Created by Mathisse Pattyn on 04/11/2025.
//

import SwiftUI

struct UurroosterListView: View{
    @Environment(UurroosterDataStore.self) var dataStore
//    @State var gekozenUurrooster: EventModel?
    @State var selectedId: String?
    @State var loading = true
    
    var body: some View{
        
        if loading {
            ProgressView("Loading...")
                .task{
                    await dataStore.loadData()
                    loading = false
                }
        }
        else{
            NavigationSplitView{
                List(dataStore.getEvents(), id: \.id, selection: $selectedId){ uurrooster in
                    VStack(alignment: .leading){
                        HStack{
                            Text(DateUtil.formatDateTime(date: uurrooster.startDateTime))
                            Spacer()
                        }
                        Text(uurrooster.title)
                    }
                    .listRowBackground(uurrooster.id == selectedId ? Color.red : Color.clear)
                    .cornerRadius(6)
                }
                .listStyle(.plain)
                    .toolbar {
                        NavigationLink(destination: AddModifyEventView(isNewEvent: true) ){
                            Image(systemName: "plus")
                        }
                    
                }
            } detail: {
                    if let id = selectedId,
                       let uurrooster = dataStore.getEvent(id: id){
                        UurroosterDetailView(uurrooster: uurrooster)
                            .toolbar {
                                NavigationLink(destination: AddModifyEventView(isNewEvent: true) ){
                                    Image(systemName: "plus")
                                }
                            }
                    }else{
                        Text("Selecteer een event")
                    }
                    
                
                }
            }
        }
            
    }
    



