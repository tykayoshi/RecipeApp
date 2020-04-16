//
//  TabBarCoordinator.swift
//  CoordinatorSkeleton
//
//  Created by Ilkay Hamit on 16/09/2019.
//  Copyright © 2019 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

protocol TabBarCoordinatorProtocol: class {
    func add(viewController: UIViewController)
    func changeSelectedIndex(index: Int)
}

class TabBarCoordinator: Coordinator {
    fileprivate weak var tabBarController: UITabBarController!
    fileprivate weak var appCoordinator: AppCoordinatorProtocol?
    fileprivate let navigationController: UINavigationController
    
    init(navigationController: UINavigationController,
         appCoordinator: AppCoordinatorProtocol,
         tabBarController: UITabBarController = UITabBarController()) {
        
        self.tabBarController = tabBarController
        self.navigationController = navigationController
        self.appCoordinator = appCoordinator
    }
    
    deinit {
        print("deallocing \(self)")
    }
    
    override func start() {
        showHomeTabBarController()
    }
    
    func showHomeTabBarController() {
        // Home
        let homeCoodinator = HomeCoordinator(tabBarController: tabBarController,
                                             tabBarCoordinator: self,
                                             navigationController: UINavigationController())
        addChildCoordinator(homeCoodinator)
        homeCoodinator.start()
        
        // Settings
        
        // Set Tab Bar on Navigation Controller
        navigationController.setViewControllers([tabBarController], animated: false)
        
    }
}

extension TabBarCoordinator: TabBarCoordinatorProtocol {
    func changeSelectedIndex(index: Int) {
        self.tabBarController.selectedIndex = index
    }
    
    func add(viewController: UIViewController) {
        self.tabBarController.add(viewController: viewController)
    }
}
