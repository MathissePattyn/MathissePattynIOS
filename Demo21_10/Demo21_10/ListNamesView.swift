//
//  ListNamesView.swift
//  Demo21_10
//
//  Created by Mathisse Pattyn on 21/10/2025.
//

import SwiftUI

struct ListNamesView: View {
    var names = ["mathisse", "justine", "marcel"]
    @State var selectedName: String?
    var body: some View {
        List(names, id: \.self, selection: $selectedName) {
            name in Text(name)
        }
        
    }
}

#Preview {
    ListNamesView()
}
