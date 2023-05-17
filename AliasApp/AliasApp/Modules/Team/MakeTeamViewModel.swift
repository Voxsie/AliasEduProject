//
//  MakeTeamViewModel.swift
//  AliasApp
//
//  Created by Илья Желтиков on 17.05.2023.
//

import Foundation

final class MakeTeamViewModel {
    
    var teams: [Team]!
    
    var dictionary: [String] = ["Молния", "Титаны", "Пылающие", "Хищники", "Бури", "Мечники", "Небеса", "Стражи", "Легион", "Пламя", "Крылья", "Черепахи", "Орлы", "Волки", "Огонь", "Вихри", "Гром", "Гладиаторы", "Повелители", "Шторм", "Воины", "Фениксы", "Пульсары", "Плутоны", "Черные кошки", "Соколы", "Викинги", "Циклоны", "Империя", "Астероиды", "Гидры", "Галактики", "Сфинксы", "Ястребы", "Лавины", "Храмы", "Планеты", "Смерчи", "Драконы", "Кометы", "Кобры", "Вулканы", "Танцоры", "Лазеры", "Молоты", "Ночные соколы", "Заклинатели", "Войводы", "Ракеты", "Пираньи", "Скорпионы", "Фараоны", "Призраки", "Луны", "Вулканы", "Северные олени", "Океаны", "Акулы", "Молнии", "Вершины", "Драконы", "Громады", "Горы", "Трещины", "Вечность", "Крепости", "Искры", "Соколиные глаза", "Оружейники", "Жнецы", "Пустыни", "Черепахи", "Магниты", "Барражи", "Танки", "Ава"]
    
    init() {
        teams = [generateTeam(), generateTeam(), generateTeam(), generateTeam()]
    }
    
    func generateTeam() -> Team {
        
        var usingNames: [String] = []
        if teams != nil {
            teams.forEach { item in
                usingNames.append(item.name) }
        }
        let rand = dictionary.randomElement() ?? "Без названия"
        if !usingNames.contains(rand) {
            return Team(id: UUID(), name: rand)
        } else {
            return generateTeam()
        }
    }
    
    func addTeam(completion: () -> Void) {
        if teams.count < 8 {
            let team = generateTeam()
            teams.append(team)
        }
        completion()
    }
    
    func deleteTeam(at index: Int, completion: () -> Void) {
        teams.remove(at: index)
        completion()
    }
}
