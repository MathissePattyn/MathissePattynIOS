//
//  ContentView.swift
//  Calculator
//
//  Created by nathalie macco on 06/10/2025.
//

import SwiftUI

struct ContentView: View {
    @State var calcEngine = CalcEngine();
    @State private var huidigeInput : String = "";
    @State private var result : String = "";
    var body: some View {
        VStack{
            HStack{
                //teksteditor
                TextEditor(text: .constant(result))
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
                            result += calcEngine.voerBewerkingUit("/") + "\n"
                        }
                    }
                    GridRow{
                        ForEach(4..<7) { number in
                            ZwarteKnop(titel: "\(number)") {
                                huidigeInput += "\(number)"
                            }
                        }
                        WitteKnop(titel: "*"){
                            result += calcEngine.voerBewerkingUit("*") + "\n"
                        }
                    }
                    GridRow{
                        ForEach(1..<4) { number in
                            ZwarteKnop(titel: "\(number)") {
                                huidigeInput += "\(number)"
                            }
                        }
                        WitteKnop(titel: "-"){
                            result += calcEngine.voerBewerkingUit("-") + "\n"
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
                            result += calcEngine.voerBewerkingUit("+") + "\n"
                        }
                        
                        
                    }
                    GridRow{
                        WitteKnop(titel: "clear"){
                            result = calcEngine.clear()
                            result = "";
                            
                        }
                        .gridCellColumns(2)
                        WitteKnop(titel: "enter"){
                            
                            result += calcEngine.enterGetal(huidigeInput)
                            huidigeInput="";
                        }
                        .gridCellColumns(2)
                        
                    }
                }
                .border(Color.blue, width: 1)
                
            }
            .border(Color.yellow, width:1)
            
            WitteKnop(titel: "Show stack") {
                result += calcEngine.showStack()
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
