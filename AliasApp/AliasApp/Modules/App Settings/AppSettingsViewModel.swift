//
//  AppSettingsViewModel.swift
//  AliasApp
//
//  Created by Илья Желтиков on 21.05.2023.
//

import Foundation

final class AppSettingsViewModel {
    
    var language: Language
    
    var isEnabledSound: Bool
    
    init() {
        self.language = DataManager.shared.getLanguage()
        self.isEnabledSound = DataManager.shared.getSoundState()
    }
    
    func saveData() {
        DataManager.shared.saveLanguage(language)
        DataManager.shared.saveSoundState(isEnabledSound)
        
        
    }
}
