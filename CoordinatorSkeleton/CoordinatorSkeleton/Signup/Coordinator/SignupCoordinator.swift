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
}

extension SignupCoordinator: SignupCoordinatorProtocol {
    
}
