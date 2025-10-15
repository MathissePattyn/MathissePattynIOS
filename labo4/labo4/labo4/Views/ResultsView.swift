//
//  ResultsView.swift
//  labo4
//
//  Created by Mathisse Pattyn on 15/10/2025.
//

import SwiftUI

struct ResultsView: View {
    let selectedTeam : String
    var body: some View {
        Text("Gekozen team: \(selectedTeam)")
    }
}

#Preview {
    ResultsView(selectedTeam: "Nederland")
}
