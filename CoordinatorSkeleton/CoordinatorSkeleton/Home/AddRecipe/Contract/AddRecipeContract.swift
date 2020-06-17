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
    
}

protocol AddRecipeInteractorProtocol {
    func postRecipe(using recipe: RecipeAPI, completion: @escaping (Result<RecipeAPI, Error>) -> Void)
}

protocol AddRecipeViewProtocol {
    
}
