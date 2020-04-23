//
//  ProfileCoordinator.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 23/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator {
    
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
        let profileViewController = ProfileViewController.makeFromStoryboard()

        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter(view: profileViewController, interactor: interactor, coordinator: self)

        profileViewController.presenter = presenter

        navigationController.setViewControllers([profileViewController], animated: false)
        tabBarCoordinator.add(viewController: navigationController)
    }
}

extension ProfileCoordinator: ProfileCoordinatorProtocol {
    
}

