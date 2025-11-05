//
//  UurroosterDetailView.swift
//  labo5
//
//  Created by Mathisse Pattyn on 05/11/2025.
//

import SwiftUI

struct UurroosterDetailView: View {
    var uurrooster : EventModel
    var body: some View {
        VStack(){
            HStack{
                HStack{
                    Text(uurrooster.title)
                }
            }
                .background(Color.red)
            
            Divider()
            
            
            VStack(alignment: .leading){
                Text(uurrooster.location)
                HStack{
                    Text("Start")
                    Spacer()
                    Text(DateUtil.formatDateTime(date: uurrooster.startDateTime))
                }
                HStack{
                    Text("Einde")
                    Spacer()
                    Text(DateUtil.formatDateTime(date: uurrooster.endDateTime))
                }
            }
            Divider()
        }
        
    }
}

