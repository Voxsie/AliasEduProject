//
//  SwapCardsViewModel.swift
//  AliasApp
//
//  Created by Tagir Kabirov on 25.05.2023.
//

import Foundation

class SwapCardsViewModel {
    
    var roundSeconds: Int
    var words: [Word]
    var givenWord: String?
    var guessedWords: [(String,Bool)] = []
    var teams: [Team]
    var currentTeam: Int = 0
    var maxScore: Int
    var teamName: String = ""
    var language: Language = .russian
    
    init(roundSeconds: Int, words: [Word], teams: [Team], maxScore: Int) {
        self.roundSeconds = roundSeconds
        self.words = words
        self.teams = teams
        self.maxScore = maxScore
        self.language = DataManager.shared.getLanguage()
    }
    
    func setWordTo(state: Bool) {
        if let word = givenWord {
            guessedWords.append((word, state))
        }
    }
    
    func getRandomWord() -> String {
        var word: String
        switch(language) {
        case .russian:
            word = words[Int.random(in: 0..<words.count)].russian
        case .english:
            word = words[Int.random(in: 0..<words.count)].english
        }
        givenWord = word
        return word
    }
    
    func changeTeam() {
        givenWord = nil
        guessedWords = []
        if currentTeam == teams.count - 1 { currentTeam = 0 }
        else { currentTeam += 1 }
        teamName = teams[currentTeam].name
    }
    
}
