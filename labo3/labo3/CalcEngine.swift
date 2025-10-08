//
//  CalcEngine.swift
//  labo3
//
//  Created by Mathisse Pattyn on 08/10/2025.
//

import Foundation

@Observable class CalcEngine{
    var result : String = "";
    var stack : [Double] = [];
    
    func enterGetal (_ invoer : String){
        if let getal = Double(invoer){
            stack.append(getal)
            result += invoer + "\n";
        }
    }
    
    func voerBewerkingUit(_ bewerking : String){
        guard let laatsteGetal = stack.popLast(),
              let voorLaatsteGetal = stack.popLast()
        else {
            result += "Not enough operands...\n"
            return
        }
        
        var resultaat : Double?
        
        switch bewerking{
        case "+" : resultaat = laatsteGetal + voorLaatsteGetal
        case "-" : resultaat = laatsteGetal - voorLaatsteGetal
        default:
            let laatsteGetal = stack.popLast()
            let voorLaatsteGetal = stack.popLast()
            result = ""
        }
    }
    
    func showStack () {
        result += "[" + stack.map{String($0)}.joined(separator: ",") + "]\n"
    }
    
}
