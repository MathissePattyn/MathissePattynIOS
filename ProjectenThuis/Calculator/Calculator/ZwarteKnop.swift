//
//  ZwarteKnop.swift
//  Calculator
//
//  Created by nathalie macco on 07/10/2025.
//

import SwiftUI

struct ZwarteKnop: View {
    
    let titel : String
    let actie : () -> Void
    
    var body: some View {
        Button(titel){
            actie()
        }
        .foregroundColor(.white)
        .padding()
        .background(Color.black)
        .cornerRadius(8)
    }
}
