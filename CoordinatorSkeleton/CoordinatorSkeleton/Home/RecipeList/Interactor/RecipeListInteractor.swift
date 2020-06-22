//
//  RecipeListInteractor.swift
//  RecipeApp
//
//  Created by Natalie Adeyinka on 13/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation


class RecipeListInteractor: RecipeListInteractorProtocol {
    
    func getRecipeList(completion: @escaping (Result<[RecipeAPI], APIError>) -> Void) {        
        ServiceLayer.request(apiRequest: GetRecipeRequest(), router: .getRecipes, requestObject: "") { (result: Result<[RecipeAPI], APIError>) in
             completion(result)
            }
    }
}
