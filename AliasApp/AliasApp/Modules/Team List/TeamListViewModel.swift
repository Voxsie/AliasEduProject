//
//  TeamListViewModel.swift
//  AliasApp
//
//  Created by Илья Желтиков on 20.05.2023.
//

import Foundation

final class TeamListViewModel {
    
    var teams: [Team] = []
    
//    var wordPack: WordPack
//
//    var gameSettings: GameSettingsModel
    
    init(teams: [Team]) {
        self.teams = teams
//        self.wordPack = wordPack
//        self.gameSettings = gameSettings
    }
}
