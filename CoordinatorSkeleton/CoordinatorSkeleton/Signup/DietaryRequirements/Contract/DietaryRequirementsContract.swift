//
//  DietaryRequirementsContract.swift
//  RecipeApp
//
//  Created by Natalie Adeyinka on 29/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

protocol DietaryRequirementsPresenterProtocol: class {
    func backButtonPressed()
    func nextButtonPressed()
    func dietaryPressed(option: String)
    func removeDietary(option: String)
}

protocol DietaryRequirementsViewProtocol: class {
    
}

protocol DietaryRequirementsInteractorProtocol: class {
    
}

