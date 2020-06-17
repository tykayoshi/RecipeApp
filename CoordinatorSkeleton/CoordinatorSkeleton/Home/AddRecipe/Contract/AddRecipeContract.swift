//
//  AddRecipeContract.swift
//  RecipeApp
//
//  Created by Rhiannaa on 28/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

protocol AddRecipePresenterProtocol {
    func cancelButtonPressed()
    func ingAddButtonPressed(ingName: String)
    func stepAddButtonPressed(step: String)
    func removeIngredient(ingName: String)
    func removeStep(step: String)
    func addRecipeButtonPressed()
    
}

protocol AddRecipeInteractorProtocol {
    func postRecipe(using recipe: RecipeAPI, completion: @escaping (Result<RecipeAPI, Error>) -> Void)
}

protocol AddRecipeViewProtocol {
    func getIngredientsList(ingList: [String])
    func getStepsList(stepsList: [String])
}
