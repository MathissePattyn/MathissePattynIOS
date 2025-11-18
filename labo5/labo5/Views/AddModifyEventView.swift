//
//  AddModifyEventView.swift
//  labo5
//
//  Created by Mathisse Pattyn on 05/11/2025.
//

import SwiftUI

struct AddModifyEventView: View {
    
    @Environment(\.dismiss) var dismiss;
    @Environment(UurroosterDataStore.self) var dataStore;
    
    var isNewEvent : Bool
    @State var event : EventModel
    
    @State private var location = "";
    @State private var title = "";
    @State private var isAllDay = false;
    @State private var startDate = Date();
    @State private var endDate = Date();
    @State private var type = 0;
    

    
    var body: some View {
        if(isNewEvent){
            Text("ADD EVENT")
            TextField("Title?", text: $title)
            TextField("Location?", text: $location)
            Toggle("All day?", isOn: $isAllDay)
            
            VStack{
                Text("Start date & time?")
                DatePicker("", selection: $startDate)
            }
            VStack{
                Text("End date & time?")
                DatePicker("", selection: $endDate)
            }
            
            Picker("Type", selection: $type){
                Text("Academic").tag(0)
                Text("Course").tag(1)
            }
            .pickerStyle(.segmented)
            
            HStack{
                Button("Save"){
                    let newEvent = EventModel();
                    newEvent.endDateTime = endDate;
                    newEvent.startDateTime = startDate;
                    newEvent.location = location;
                    newEvent.title = title;
                    newEvent.type = type;
                    newEvent.allDay = isAllDay;
                    newEvent.id = UUID().uuidString;
                    
                    dataStore.addEvent(event: newEvent)
                    dismiss();
                }
                Button("Cancel"){
                    dismiss();
                }
            }
            
        } else{
            Text("EDIT EVENT")
            Text(event.title)
            TextField("Location?", text: $event.location)
            Toggle("All day?", isOn: $isAllDay)
            
            VStack{
                Text("Start date & time?")
                DatePicker("", selection: $event.startDateTime)
            }
            VStack{
                Text("End date & time?")
                DatePicker("", selection: $event.endDateTime)
            }
            Picker("Type", selection: $event.type){
                Text("Academic").tag(0)
                Text("Course").tag(1)
            }
            .pickerStyle(.segmented)
            HStack{
                Button("Update"){
                    dataStore.updateEvent(event: event)
                    dismiss();
                }
                Button("Cancel"){
                    dismiss();
                }
            }
        }
        
    }
}

