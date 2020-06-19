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
    func ingAddButtonPressed(ingName: String, ingAmount: String)
    func removeIngredient(ingName: String)
    func stepAddButtonPressed(step: String)
    func removeStep(step: String)
    func addRecipeButtonPressed()
    func postRecipe()
    
}

protocol AddRecipeInteractorProtocol {
    func postRecipe(using recipe: RecipeAPI, completion: @escaping (Result<RecipeAPI, APIError>) -> Void)
}

protocol AddRecipeViewProtocol {
    func getIngredientsList(ingList: [String:String])
    func getStepsList(stepsList: [String])
}
