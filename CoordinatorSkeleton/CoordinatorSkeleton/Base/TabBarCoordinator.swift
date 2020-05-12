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
    fileprivate var currentUser = UserManager.shared

    
    init(navigationController: UINavigationController,
         appCoordinator: AppCoordinatorProtocol,
         tabBarController: UITabBarController = UITabBarController(), currentUser:UserManager) {
        
        self.tabBarController = tabBarController
        self.navigationController = navigationController
        self.appCoordinator = appCoordinator
        self.currentUser = currentUser
    }
    
    deinit {
        print("deallocing \(self)")
    }
    
    override func start() {
        showTabBarController()
    }
    
    func showTabBarController() {
        // Home
        let homeCoodinator = HomeCoordinator(tabBarController: tabBarController,
                                             tabBarCoordinator: self,
                                             navigationController: UINavigationController(), currentUser: currentUser)
        addChildCoordinator(homeCoodinator)
        homeCoodinator.start()
        
        // Profile
        let profileCoordinator = ProfileCoordinator(tabBarController: tabBarController,
                                                      tabBarCoordinator: self,
                                                      navigationController: UINavigationController())
        
        addChildCoordinator(profileCoordinator)
        profileCoordinator.start()
        
        // Settings
        let settingsCoordinator = SettingsCoordinator(tabBarController: tabBarController,
                                                      tabBarCoordinator: self,
                                                      navigationController: UINavigationController())
        
        addChildCoordinator(settingsCoordinator)
        settingsCoordinator.start()
        
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
