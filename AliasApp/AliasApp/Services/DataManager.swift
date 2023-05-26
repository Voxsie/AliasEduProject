//
//  DataManager.swift
//  AliasApp
//
//  Created by Ilya Zheltikov on 26.05.2023.
//

import Foundation

enum Language {
    case russian
    case english
}

struct DataManager {
    
    static let shared = DataManager()
    
    func getLanguage() -> Language {
        
        guard let userDefaultsValue = UserDefaults.standard.string(forKey: "language")
        else { UserDefaults.standard.set("russian", forKey: "language"); return .russian }
        
        switch userDefaultsValue {
        case "russian":
            return .russian
        case "english":
            return .english
        default:
            return .russian
        }
    }
    
    func saveLanguage(_ language: Language) {
        switch language {
        case .russian:
            UserDefaults.standard.set("russian", forKey: "language")
        case .english:
            UserDefaults.standard.set("english", forKey: "language")
        }
    }
    
    func getSoundState() -> Bool {
        if UserDefaults.standard.value(forKey: "isEnabledSound") == nil {
            saveSoundState(true)
            return true
        } else {
            return UserDefaults.standard.bool(forKey: "isEnabledSound")
        }
    }
    
    func saveSoundState(_ bool: Bool) {
        UserDefaults.standard.set(bool, forKey: "isEnabledSound")
    }
}
