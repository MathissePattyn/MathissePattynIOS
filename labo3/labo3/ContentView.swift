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
//                    .border(Color.red, width: 1)
                    .padding()
                    .frame(width: 100, height: 150)
                
                Grid{
                    GridRow{
                        ForEach(7..<10) { number in
                            ZwarteKnop(titel: "\(number)"){
                                huidigeInvoer += "\(number)"
                                calcEngine.toonCijfer("\(number)")
                            }
                            .colorInvert()
                        }
                        ZwarteKnop(titel: "*"){
                            calcEngine.voerBewerkingUit("*")
                        }
                    
                    }
                    
                    GridRow{
                        ForEach(4..<7) { number in
                            ZwarteKnop(titel: "\(number)"){
                                calcEngine.toonCijfer("\(number)")
                                huidigeInvoer += "\(number)"
                            }
                            .colorInvert()
                        }
                        ZwarteKnop(titel: "/"){
                            calcEngine.voerBewerkingUit("/")
                        }
                    }
                    
                    GridRow{
                        ForEach(1..<4) { number in
                            ZwarteKnop(titel: "\(number)"){
                                calcEngine.toonCijfer("\(number)")
                                huidigeInvoer += "\(number)"
                            }
                            .colorInvert()
                        }
                        ZwarteKnop(titel: "-"){
                            calcEngine.voerBewerkingUit("-")
                        }
                    }
                    
                    GridRow{
                        let number = 0
                        ZwarteKnop(titel: "\(number)"){
                            calcEngine.toonCijfer("\(number)")
                            huidigeInvoer += "\(number)"
                        }
                        .colorInvert()
                        Text(" ")
                        Text(" ")
                        ZwarteKnop(titel: "+"){
                            calcEngine.voerBewerkingUit("+")
                        }
                    }
                    
                    GridRow{
                        ZwarteKnop(titel: "clear"){
                            calcEngine.clearStack()
                        }
                        .gridCellColumns(2)
                        
                        ZwarteKnop(titel: "enter"){
                            calcEngine.enterGetal(huidigeInvoer)
                            huidigeInvoer=""
                        }
                        .gridCellColumns(2)
                    }
                }
//                .border(Color.red, width: 1)
                .padding()
            }
//            .border(Color.yellow, width: 1)
            
            ZwarteKnop(titel: "Show Stack"){
                calcEngine.showStack()
            }
        }
//        .border(Color.yellow, width: 1)
    }
}

#Preview {
    ContentView()
}
