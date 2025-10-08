//
//  CalcEngine.swift
//  Calculator
//
//  Created by nathalie macco on 06/10/2025.
//

import Foundation

class CalcEngine : ObservableObject{
    @Published var result : String = "";
    var stack: [Double] = [];
    
    
    func enterGetal (_ input: String){
        if let getal = Double(input){
            stack.append(getal)
            result += "\(getal)\n"
        }
        
    }
    

    func showStack() {
        result += "[" + stack.map { String($0) }.joined(separator: ", ") + "]"
    }
    
    func clear(){
        stack.removeAll();
        result = ""
    }
    
    func voerBewerkingUit(_ bewerking : String){
        
        guard
            let laatstIngevoerdeGetal = stack.popLast(),
            let voorlaatsteIngevoerdeGetal = stack.popLast()
        else {
            result = "Not enough operand...\n" + result
            return
        }
        
        var resultaat : Double?;
        
        switch bewerking{
        case "+":
            resultaat = voorlaatsteIngevoerdeGetal + laatstIngevoerdeGetal
        case "-":
            resultaat = voorlaatsteIngevoerdeGetal - laatstIngevoerdeGetal
        case "*":
            resultaat = voorlaatsteIngevoerdeGetal * laatstIngevoerdeGetal
        case "/":
            resultaat = laatstIngevoerdeGetal / voorlaatsteIngevoerdeGetal
        default:
//              result = "Unknown operation"
              // Zet getallen terug op de stack
              stack.append(voorlaatsteIngevoerdeGetal)
              stack.append(laatstIngevoerdeGetal)
              result = "error"
        }
        
        if let res = resultaat {
            stack.append(res)
            result += "\n\(bewerking) \n\(res)"
        }
    }
    
}
