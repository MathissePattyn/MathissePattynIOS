//
//  WitteKnop.swift
//  Calculator
//
//  Created by nathalie macco on 07/10/2025.
//

import SwiftUI

struct WitteKnop: View {
    
    let titel : String
    let actie : () -> Void
    
    var body: some View {
        Button(titel){
            actie()
        }
        .foregroundColor(.black)
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
    }
}
