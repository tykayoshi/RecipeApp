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
        // Create VIPER modules for dietary requirements screens, contract, presenter, view, etc...
        // in presentDietaryRequirements() push to the dietary requirements view
        // Don't forget to have the user in the presenter as we are passing this object
        
        // Create the view with auto layout etc..
        // Create buttons for each dietary requirement
        // When a user clicks a button in the view, tell the presenter it's been clicked and add it to a dietary requirements array.
        // When clicking next, add dietary requirements array to currentUser
        // Move current user to next screen (essential items)
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
    
    func popBackScreen() {
        navigationController.popViewController(animated: true)
    }
}

