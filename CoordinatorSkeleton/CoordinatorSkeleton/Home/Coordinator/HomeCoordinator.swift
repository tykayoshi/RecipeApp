//
//  HomeCoordinator.swift
//  CoordinatorSkeleton
//
//  Created by Ilkay Hamit on 16/09/2019.
//  Copyright © 2019 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

// test commit

class HomeCoordinator: Coordinator, RecipeListCoordinatorProtocol {
    
    let tabBarController: UITabBarController
    let tabBarCoordinator: TabBarCoordinatorProtocol
    let navigationController: UINavigationController
    var currentUser = UserManager.shared
    
    
    init(tabBarController: UITabBarController,
         tabBarCoordinator: TabBarCoordinatorProtocol,
         navigationController: UINavigationController, currentUser: UserManager) {
        
        self.tabBarController = tabBarController
        self.tabBarCoordinator = tabBarCoordinator
        self.navigationController = navigationController
        self.currentUser = currentUser
    }
    
    deinit {
        print("deallocing \(self)")
    }
    
    override func start() {        
        let homeViewController = HomeViewController.makeFromStoryboard()
        
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: homeViewController, interactor: interactor, coordinator: self, currentUser: currentUser)
        
        homeViewController.presenter = presenter
        
        navigationController.setViewControllers([homeViewController], animated: false)
        navigationController.isNavigationBarHidden = true
        tabBarCoordinator.add(viewController: navigationController)
    }
    
    func presentRecipeList() {
        let recipeListViewController = RecipeListViewController.makeFromStoryboard()
        let interactor = RecipeListInteractor()
        let presenter = RecipeListPresenter(view: recipeListViewController, interactor: interactor, coordinator: self)
        
        recipeListViewController.presenter = presenter
        
        navigationController.pushViewController(recipeListViewController, animated: true)
        
    }
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func showRecipeList() {
        self.presentRecipeList()
    }
}
