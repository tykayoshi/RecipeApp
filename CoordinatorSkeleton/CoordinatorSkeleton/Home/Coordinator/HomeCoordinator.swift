//
//  HomeCoordinator.swift
//  CoordinatorSkeleton
//
//  Created by Ilkay Hamit on 16/09/2019.
//  Copyright © 2019 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    
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
        let homeViewController = HomeViewController.makeFromStoryboard()
        
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: homeViewController, interactor: interactor, coordinator: self)
        
        homeViewController.presenter = presenter
        
        navigationController.setViewControllers([homeViewController], animated: false)
        tabBarCoordinator.add(viewController: navigationController)
    }
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    
}
