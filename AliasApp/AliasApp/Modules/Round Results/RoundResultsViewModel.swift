//
//  RoundCountedWordsViewModel.swift
//  AliasApp
//
//  Created by Арслан Рашидов on 25.05.2023.
//

import Foundation

import Foundation

final class RoundResultsViewModel {
    
    var teams: [Team]
    var winner: Team!
    
    init(teams: [Team]) {
        self.teams = teams
        self.winner = self.get_winner()
    }
    
    func get_winner() -> Team {
        var max_points: Double = 0.0
        var current_winner: Team = teams[0]
        for team in self.teams {
            if team.score > max_points {
                max_points = team.score
                current_winner = team
            }
        }
        return current_winner
    }
}
