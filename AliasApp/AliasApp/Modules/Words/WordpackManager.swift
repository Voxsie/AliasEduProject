//
//  WordpackManager.swift
//  AliasApp
//
//  Created by Илья Желтиков on 18.05.2023.
//

import Foundation
import UIKit

struct Word {
    var english: String
    var russian: String
}

struct WordPack {
    var title: String
    var logo: UIImage
    var words: [Word]
    var isUnlocked: Bool = false
}

final class WordPackManager {
    
    static var shared = WordPackManager()
    
    func getListOfPacks() -> [WordPack] {
        return [
            WordPack(title: "Общие",
                     logo: UIImage(named: "generalWordPack") ?? UIImage(),
                     words: getGeneralWords(),
                     isUnlocked: true),
            WordPack(title: "Города",
                     logo: UIImage(named: "citiesWordPack") ?? UIImage(),
                     words: getCitiesWords(),
                     isUnlocked: true),
            WordPack(title: "Одежда",
                     logo: UIImage(named: "clothesWordPack") ?? UIImage(),
                     words: getClothesWords(),
                     isUnlocked: true),
            WordPack(title: "Кино",
                     logo: UIImage(named: "movieWordPack") ?? UIImage(),
                     words: getClothesWords(),
                     isUnlocked: false)
        ]
    }
}
