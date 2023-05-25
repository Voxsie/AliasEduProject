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
    var wordPack: WordPack
    
    init(teams: [Team], wordPack: WordPack) {
        self.teams = teams
        self.wordPack = wordPack
    }
}
