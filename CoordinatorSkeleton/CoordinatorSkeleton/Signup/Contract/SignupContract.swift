//
//  SignupContract.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 27/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

protocol SignupCoordinatorProtocol: class {
    func showRegisterName()
    func popBackScreen()
}

protocol SignupPresenterProtocol: class {
    func signupButtonPressed()
}

protocol SignupViewProtocol: class {
    
}

protocol SignupInteractorProtocol: class {
    
}
