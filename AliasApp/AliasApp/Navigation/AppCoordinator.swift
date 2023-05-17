//
//  AppCoordinator.swift
//  AliasApp
//
//  Created by Илья Желтиков on 16.05.2023.
//

import Foundation
import UIKit

class AppCoordinator {
    
    static var window: UIWindow?
    
    static let shared = AppCoordinator()
    
    var navigationController: UINavigationController?
    
    func start() {
        let menuVC = MainMenuViewController(withViewModel: MainScreenViewModel())
        navigationController = UINavigationController(rootViewController: menuVC)
        AppCoordinator.window?.rootViewController = navigationController
        AppCoordinator.window?.makeKeyAndVisible()
    }
    
    func showTeamScreen() {
        self.navigationController?.pushViewController(MakeTeamsViewController(withViewModel: MakeTeamViewModel()), animated: true)
    }
}
