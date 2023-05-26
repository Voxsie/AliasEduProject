//
//  RoundCountedWordsViewModel.swift
//  AliasApp
//
//  Created by Арслан Рашидов on 25.05.2023.
//

import Foundation

import Foundation

final class RoundCountedWordsViewModel {
    
    var teams: [Team]
    var words: [(word: String, state: Bool)]
    var currentTeamIndex: Int
    var maxScore: Int
    
    init(teams: [Team], words: [(String, Bool)], currentTeamIndex: Int, maxScore: Int) {
        self.teams = teams
        self.words = words
        self.currentTeamIndex = currentTeamIndex
        self.maxScore = maxScore
    }
    
    func addPoints() -> Bool {
        let currentTeam = teams[currentTeamIndex]
        words.forEach { word in
            if word.state { currentTeam.score += 1 }
            else { currentTeam.score -= 1 }
        }
        return Int(currentTeam.score) >= maxScore
    }
}
