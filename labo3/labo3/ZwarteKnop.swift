//
//  ZwarteKnop.swift
//  labo3
//
//  Created by Mathisse Pattyn on 14/10/2025.
//

import SwiftUI

struct ZwarteKnop: View {
    let titel : String
    let actie : () -> Void
    
    var body: some View {
        Button(titel){
            actie()
        }
        .buttonStyle(.bordered)
    }
}

#Preview {
    ContentView()
}

