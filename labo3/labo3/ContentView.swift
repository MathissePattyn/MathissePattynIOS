//
//  ContentView.swift
//  labo3
//
//  Created by Mathisse Pattyn on 01/10/2025.
//

import SwiftUI

struct ContentView: View {
    @State var calcEngine = CalcEngine()
//    @State var result = "";
    @State private var huidigeInvoer = "";
    var body: some View {
        VStack{
            HStack{
                TextEditor(text: .constant(calcEngine.result))
                    .border(Color.red, width: 1)
                    .padding()
                    .frame(width: 100, height: 150)
                
                Grid{
                    GridRow{
                        ForEach(7..<10) { number in
                            Button("\(number)") {
                                huidigeInvoer += "\(number)"
                            }
                        }
                        Button("*"){
                            
                        }
                    }
                    
                    GridRow{
                        ForEach(4..<7) { number in
                            Button("\(number)") {
                                huidigeInvoer += "\(number)"
                            }
                        }
                        Button("/"){
                            
                        }
                    }
                    
                    GridRow{
                        ForEach(1..<4) { number in
                            Button("\(number)") {
                                huidigeInvoer += "\(number)"
                            }
                        }
                        Button("-"){
                            
                        }
                    }
                    
                    GridRow{
                        let number = 0
                        Button("\(number)"){
                            huidigeInvoer += "\(number)"
                        }
                        Text(" ")
                        Text(" ")
                        Button("+"){
                            
                        }
                    }
                    
                    GridRow{
                        Button("Clear"){
                            
                        }
                        .gridCellColumns(2)
                        
                        Button("Enter"){
                            calcEngine.enterGetal(huidigeInvoer)
                            huidigeInvoer = "";
                        }
                        .gridCellColumns(2)
                    }
                }
                .border(Color.red, width: 1)
                .padding()
            }
            .border(Color.yellow, width: 1)
            
            Button("Show Stack"){
                calcEngine.showStack()
            }
        }
        .border(Color.yellow, width: 1)
    }
}

#Preview {
    ContentView()
}
