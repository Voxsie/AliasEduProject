//
//  Paragraph.swift
//  AliasApp
//
//  Created by NaYfront on 26.05.2023.
//

import Foundation
import UIKit

struct Paragraph {
    var image: String
    var title: String
    var text: String
}

extension Paragraph {
    static let paragraphs: [Paragraph] =
    [
        Paragraph(image: "target", title: "Цель", text: "Каждый игрок должен объяснить как можно больше слов своим товарищам по команде за ограниченное время."),
        Paragraph(image: "forbidden", title: "Запрещено", text: "При объяснении слов нельзя упоминать какую-либо часть слова, а также переводить с других языков."),
        Paragraph(image: "star", title: "Очки", text: "За отгаданное слово команда получает одно очко, но за пропущенное слово команда теряет одно очко"),
        Paragraph(image: "trophy", title: "Победа", text: "Чтобы победить в игре, команда должна набрать заранее определенное количество очков.")
    ]
}
