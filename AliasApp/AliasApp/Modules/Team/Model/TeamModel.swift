//
//  TeamModel.swift
//  AliasApp
//
//  Created by Илья Желтиков on 17.05.2023.
//

import Foundation
import UIKit

class Team {
    var id: UUID
    var name: String
    var score: Double
    
    init(id: UUID, name: String, score: Double) {
        self.id = id
        self.name = name
        self.score = score
    }
}
