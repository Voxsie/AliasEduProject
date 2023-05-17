//
//  MainScreenViewModel.swift
//  AliasApp
//
//  Created by Илья Желтиков on 17.05.2023.
//

import Foundation

final class MainScreenViewModel {
    
    @objc
    func startGame() {
        AppCoordinator.shared.showTeamScreen()
    }
}
