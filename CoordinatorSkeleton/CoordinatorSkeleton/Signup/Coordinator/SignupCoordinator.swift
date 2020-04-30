//
//  SignupCoordinator.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 27/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

class SignupCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("deallocing \(self)")
    }
    
    override func start() {
        let signupViewController = SignupViewController.makeFromStoryboard()

        let interactor = SignupInteractor()
        let presenter = SignupPresenter(view: signupViewController, interactor: interactor, coordinator: self)

        signupViewController.presenter = presenter

        navigationController.setViewControllers([signupViewController], animated: false)
    }
    
    func presentRegisterName() {
        let registerNameController = RegisterNameViewController.makeFromStoryboard()
        let interactor = RegisterNameInteractor()
        let presenter = RegisterNamePresenter(view: registerNameController, interactor: interactor, coordinator: self)
        
        registerNameController.presenter = presenter
        
        navigationController.pushViewController(registerNameController, animated: true)
    }
    
    func presentDietaryRequirements(currentUser: UserManager) {
        let dietaryRequirementsController = DietaryRequirementsViewController.makeFromStoryboard()
        let interactor = DietaryRequirementsInteractor()
        let presenter = DietaryRequirementsPresenter(view: dietaryRequirementsController, interactor: interactor, coordinator: self, currentUser: currentUser)
        
        dietaryRequirementsController.presenter = presenter
        
        navigationController.pushViewController(dietaryRequirementsController, animated: true)
        
    }
    
    func presentShoppingEssentials(currentUser: UserManager){
        let shoppingEssentialsController = ShoppingEssentialsViewController.makeFromStoryboard()
        let interactor = ShoppingEssentialsInteractor()
        let presenter = ShoppingEssentialsPresenter(view: shoppingEssentialsController, interactor: interactor, coordinator: self, currentUser: currentUser)
        
        shoppingEssentialsController.presenter = presenter
        
        navigationController.pushViewController(shoppingEssentialsController, animated: true)
    }
}

extension SignupCoordinator: SignupCoordinatorProtocol {
    func showDietaryRequirements(currentUser: UserManager) {
        self.presentDietaryRequirements(currentUser: currentUser)
    }
    
    func showRegisterName() {
        // Show Register Name View
        self.presentRegisterName()
    }
    
    func showShoppingEssentials(currentUser: UserManager){
        self.presentShoppingEssentials(currentUser: currentUser)
    }
    
    func popBackScreen() {
        navigationController.popViewController(animated: true)
    }
}

