//
//  AddRecipeInteractor.swift
//  RecipeApp
//
//  Created by Rhiannaa on 28/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

class AddRecipeInteractor: AddRecipeInteractorProtocol {
    func postRecipe(using recipe: RecipeAPI, completion: @escaping (Result<RecipeAPI, Error>) -> Void) {
        ServiceLayer.request(router: Router.postRecipes, data: recipe) { (result: Result<RecipeAPI, Error>) in
                switch result {
                case .success:
                    completion(result)
                case .failure:
                    completion(result)
                }
        }
    }
}
