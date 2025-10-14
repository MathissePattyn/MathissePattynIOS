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
    
//    func enterGetal (_ invoer : String){
//        if let getal = Double(invoer){
//            stack.append(getal)
//            result = invoer + "\n" + result
//        }
//    }

    func enterGetal(_ invoer: String) {
           if let getal = Double(invoer) {
               stack.append(getal)

               var regels = result.components(separatedBy: "\n")
               
               // Zorg dat actieve invoerregel bestaat
               if regels.isEmpty {
                   regels = [""]
               }

               // Voeg de invoer toe als nieuwe regel *onder* de actieve invoer (regel 1)
               if regels.count > 1 {
                   regels.insert(invoer, at: 1)
               } else {
                   regels.append(invoer)
               }

               // Reset actieve invoer (regel 0)
               regels[0] = ""

               // Update result
               result = regels.joined(separator: "\n")
           }
       }



    
//    func toonCijfer(_ invoer: String) {
//        // Splits result in regels
//        var regels = result.components(separatedBy: "\n")
//        
//        if regels.isEmpty {
//            // Geen regels, begin met invoer
//            regels = [invoer]
//        } else {
//            // Voeg cijfer toe aan eerste regel (huidige invoer)
//            regels[0] += invoer
//        }
//        
//        // Zet de regels weer terug in result
//        result = regels.joined(separator: "\n")
//    }

    func toonCijfer(_ invoer: String) {
    
        // Splits result in regels
        var regels = result.components(separatedBy: "\n")
        // Stap 1: verwijder de hele inhoud van eerste regel (actieve invoer)
        if !regels.isEmpty {
            regels[0].removeAll()
        } else {
            regels = [""]
        }

        // Stap 2: vul de eerste regel opnieuw met alleen het nieuwe cijfer
        regels[0] = regels[0] + invoer

        // Stap 3: voeg eerste regel en rest samen
        result = regels.joined(separator: "\n")
    }

    
    func voerBewerkingUit(_ bewerking : String){
        guard let laatsteGetal = stack.popLast(),
              let voorLaatsteGetal = stack.popLast()
        else {
            result = "Not enough operands...\n" + result
            return
        }
        
        var resultaat : Double?
        
        switch bewerking{
        case "+" : resultaat = laatsteGetal + voorLaatsteGetal
        case "-" : resultaat = laatsteGetal - voorLaatsteGetal
        case "*" : resultaat = laatsteGetal * voorLaatsteGetal
        case "/" : resultaat = laatsteGetal/voorLaatsteGetal
        default:
            stack.append(voorLaatsteGetal)
            stack.append(laatsteGetal)
            result = ""
        }
        if let res = resultaat{
            stack.append(res)
            result = "\(res)\n\(bewerking)\n" + result
        }
    }
    
    func clearStack(){
        stack.removeAll()
        result = ""
    }
    
    
    func showStack () {
        result = "[" + stack.map{String($0)}.joined(separator: ",") + "]" + result
    }
    
}
