//
//  CalcEngine.swift
//  Calculator
//
//  Created by nathalie macco on 06/10/2025.
//

import Foundation

class CalcEngine{
//    var result : String = "";
    var stack: [Double] = [];
    
    
    func enterGetal (_ input: String) -> String{
        if let getal = Double(input){
            stack.append(getal)
            return "\(getal)\n"
        }
        return "ongeldig"
    }
    
//    func updateResult() {
//        if let laatste = stack.last {
//            result = String(laatste);
//        }
//    }
//
    func showStack() -> String{
//        let stacklijn =
        return "[" + stack.map { String($0) }.joined(separator: ", ") + "]"
//        result += stacklijn + "\n" + result
    }
    
    func clear() -> String{
        stack.removeAll();
//        result = "";
        return ""
    }
    
    func voerBewerkingUit(_ bewerking : String) -> String{
        
        guard
            let laatstIngevoerdeGetal = stack.popLast(),
            let voorlaatsteIngevoerdeGetal = stack.popLast()
        else {
            return "Not enough operands...";
//            result = "Not enough operand...\n" + result
//            return
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
              return "error"
        }
        
        if let res = resultaat {
            stack.append(res)
            return "\n\(bewerking) \n\(res)"
        }
        return "error"
    }
    
}
