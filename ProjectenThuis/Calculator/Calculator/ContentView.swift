//
//  ContentView.swift
//  Calculator
//
//  Created by nathalie macco on 06/10/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var calcEngine = CalcEngine();
    @State private var huidigeInput : String = "";

    var body: some View {
        VStack{         //GEEL
            HStack{     //BLAUW
                //teksteditor
                TextEditor(text: $calcEngine.result)
                    .frame(width: 100, height: 350)
                    .border(Color.blue, width: 1)
                    .background(Color.white)
                    .padding()
                    .disabled(true)
                
                
                Grid{
                    GridRow{
                        ForEach(7..<10) { number in
                            ZwarteKnop(titel: "\(number)") {
                                huidigeInput += "\(number)"
                            }
                        }
                        WitteKnop(titel: "/"){
//                            calcEngine.voerBewerkingUit("/")
                            calcEngine.voerBewerkingUit("/")
                        }
                    }
                    GridRow{
                        ForEach(4..<7) { number in
                            ZwarteKnop(titel: "\(number)") {
                                huidigeInput += "\(number)"
                            }
                        }
                        WitteKnop(titel: "*"){
                            calcEngine.voerBewerkingUit("*")
                        }
                    }
                    GridRow{
                        ForEach(1..<4) { number in
                            ZwarteKnop(titel: "\(number)") {
                                huidigeInput += "\(number)"
                            }
                        }
                        WitteKnop(titel: "-"){
                            calcEngine.voerBewerkingUit("-")
                        }
                    }
                    GridRow{
                        let number = 0;
                        ZwarteKnop(titel: "\(number)") {
                            huidigeInput += "\(number)"
                        }
                        
                        Button(" ") {} // lege string, geen actie
                            .foregroundColor(.clear)
                            .padding()
                            .background(Color.clear)
                        Button(" ") {} // lege string, geen actie
                            .foregroundColor(.clear)
                            .padding()
                            .background(Color.clear)
                        
                        
                        WitteKnop(titel: "+"){
                            calcEngine.voerBewerkingUit("+")
                        }
                        
                        
                    }
                    GridRow{
                        WitteKnop(titel: "clear"){
                            calcEngine.clear()
                            
                        }
                        .gridCellColumns(2)
                        WitteKnop(titel: "enter"){
                            
                            calcEngine.enterGetal(huidigeInput)
                            huidigeInput="";
                        }
                        .gridCellColumns(2)
                        
                    }
                }
                .border(Color.blue, width: 1)
                
            }
            .border(Color.yellow, width:1)
            
            WitteKnop(titel: "Show stack") {
                calcEngine.showStack()
            }
            .frame( alignment: .leading)
            .padding(.leading, 24)

        }
        .border(Color.yellow, width: 1)
        

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
