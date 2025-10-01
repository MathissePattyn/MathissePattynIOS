//
//  ContentView.swift
//  labo3
//
//  Created by Mathisse Pattyn on 01/10/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Texteditor")
                Grid{
                    GridRow{
                        ForEach(7..<10) { number in
                            Button("\(number)") {
                                
                            }
                            
                        }
                        GridRow{
                            ForEach(7..<9) { number in
                                Button("\(number)") {
                                    
                                }
                                Text("*")
                            }
                            GridRow{
                                ForEach(6..<10) { number in
                                    Button("\(number)") {
                                        
                                    }
                                    Text("-")
                                }
                                GridRow{
                                    Text("0")
                                    Text("+")
                                    
                                }
                                GridRow{
                                    Text("Clear")
                                    Text("Enter")
                                    
                                }
                            }
                        }
                        Text("Show stack")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
