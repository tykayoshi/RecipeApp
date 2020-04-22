//
//  RhiannaaCoordinator.swift
//  RecipeApp
//
//  Created by Rhiannaa on 22/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

class RhiannaaCoordinator: Coordinator {
    
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
        let rhiannaaViewController = RhiannaaViewController.makeFromStoryboard()

        let interactor = RhiannaaInteractor()
        let presenter = RhiannaaPresenter(view: rhiannaaViewController, interactor: interactor, coordinator: self)

        rhiannaaViewController.presenter = presenter

        navigationController.setViewControllers([rhiannaaViewController], animated: false)
        tabBarCoordinator.add(viewController: navigationController)
    }
}

extension RhiannaaCoordinator: RhiannaaCoordinatorProtocol {
    
}

