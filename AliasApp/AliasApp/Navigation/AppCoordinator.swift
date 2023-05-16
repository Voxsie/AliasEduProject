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
    
    func start() {
        let menuVC = MainMenuViewController()
        let navCon = UINavigationController(rootViewController: menuVC)
        AppCoordinator.window?.rootViewController = navCon
        AppCoordinator.window?.makeKeyAndVisible()
    }
    
}
