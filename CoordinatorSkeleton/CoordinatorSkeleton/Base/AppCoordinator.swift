//
//  AppCoordinator.swift
//  CoordinatorSkeleton
//
//  Created by Ilkay Hamit on 16/09/2019.
//  Copyright © 2019 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol: class {
    func showSignUp()
    func showHome()
}

class AppCoordinator: Coordinator {
    
    fileprivate let navigationController: UINavigationController
    fileprivate let userManager = UserManager.shared
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        if !userManager.hasCompletedSignup! {
            print("showSignUp")
            showSignUp()
        } else {
            print("showHome")
            showHome()
        }
    }
}


extension AppCoordinator: AppCoordinatorProtocol {
    func showSignUp() {
        removeAllChildCoordinators()
        navigationController.viewControllers.removeAll()
        let signupCoordinator = SignupCoordinator(navigationController: navigationController, appCoordinator: self)
        navigationController.isNavigationBarHidden = true
        signupCoordinator.start()
        addChildCoordinator(signupCoordinator)
    }
    
    func showHome() {
        removeAllChildCoordinators()
        navigationController.viewControllers.removeAll()
        let homeCoordinator = TabBarCoordinator(navigationController: navigationController, appCoordinator: self, currentUser: userManager)
        navigationController.isNavigationBarHidden = true
        homeCoordinator.start()
        addChildCoordinator(homeCoordinator)
    }
}
