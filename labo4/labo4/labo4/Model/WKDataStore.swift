//
//  WKDataStore.swift
//  labo4
//
//  Created by Mathisse Pattyn on 14/10/2025.
//

import Foundation
import Combine
import SwiftUI
import SwiftData

@Observable
class WKDataStore {
    
    var results : [WKResult] = []
    
    init(){
        loadResults()
    }
    
    
    func loadResults(){
        results = load("WKResultsQatar.json")
    }
    
    func getAllTeams() -> [String] {
        let teams = results.flatMap { [$0.homeTeam, $0.awayTeam] }
        let filteredTeams = teams.filter { team in
            guard let first = team.first else { return false }
            // Filter uit als het team begint met een cijfer of "To be announced" is
            return !first.isNumber && team != "To be announced"
        }
        
        //UNIEKE TEAMS DOOR ER EEN SET VAN TE MAKEN
        return Array(Set(filteredTeams)).sorted()
    }
    
    func getAllStadionsOfAllTeams() -> [String] {
        let locaties = results.map{ $0.location}
        return Array(Set(locaties)).sorted()
    }

}

