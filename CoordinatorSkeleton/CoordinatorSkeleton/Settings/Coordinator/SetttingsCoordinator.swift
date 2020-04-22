//
//  SetttingsCoordinator.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 22/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

class SettingsCoordinator: Coordinator {
    
    let tabBarController: UITabBarController
    let tabBarCoordinator: TabBarCoordinatorProtocol
    let navigationController: UINavigationController
    
    init(tabBarController: UITabBarController,
         tabBarCoordinator: TabBarCoordinatorProtocol,
         navigationController: UINavigationController) {
        
        self.tabBarController = tabBarController
        self.tabBarCoordinator = tabBarCoordinator
        self.navigationController = navigationController
    }
    
    deinit {
        print("deallocing \(self)")
    }
    
    override func start() {
        let settingsViewController = SettingsViewController.makeFromStoryboard()

        let interactor = SettingsInteractor()
        let presenter = SettingsPresenter(view: settingsViewController, interactor: interactor, coordinator: self)

        settingsViewController.presenter = presenter

        navigationController.setViewControllers([settingsViewController], animated: false)
        tabBarCoordinator.add(viewController: navigationController)
    }
}

extension SettingsCoordinator: SettingsCoordinatorProtocol {
    
}

