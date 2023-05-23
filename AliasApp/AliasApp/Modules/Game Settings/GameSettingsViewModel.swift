//
//  GameSettingsViewModel.swift
//  AliasApp
//
//  Created by Илья Желтиков on 18.05.2023.
//

import Foundation



final class GameSettingsViewModel {
    
    var teams: [Team]!
    
    var wordPack: WordPack!
    
    init(teams: [Team]!, wordPack: WordPack!) {
        self.teams = teams
        self.wordPack = wordPack
    }
    
    var model = GameSettingsModel(timePerRound: 60, pointsToWin: 50, isSubtract: false)
    
}
