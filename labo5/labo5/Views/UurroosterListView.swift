//
//  UurroosterList.swift
//  labo5
//
//  Created by Mathisse Pattyn on 04/11/2025.
//

import SwiftUI

struct UurroosterListView: View{
    @Environment(UurroosterDataStore.self) var dataStore
    @Binding var gekozenUurrooster: String?
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
            List(dataStore.uurrooster, id: \.id, selection: $gekozenUurrooster){ uurrooster in
                VStack(alignment: .leading){
                    HStack{
                        Text(DateUtil.formatDateTime(date: uurrooster.startDateTime))
                        Spacer()
                    }
                    Text(uurrooster.title)
                }
                
                if let gekozenUurrooster = gekozenUurrooster{
                }
            }
        }
            
    }
    
}


