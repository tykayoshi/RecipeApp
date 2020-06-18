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
//        ServiceLayer.request(router: Router.getRecipes, data: nil) { (result: Result<[RecipeAPI], Error>) in
//                switch result {
//                case .success:
//                    completion(result)
//                case .failure:
//                    completion(result)
//                }
//        }
        
//        ServiceLayer.request(apiRequest: GetRecipeRequest(), router: , requestObject: "") { (result: Result<[RecipeAPI], Error>) in
//                switch result {
//                case .success:
//                    completion(result)
//                case .failure:
//                    completion(result)
//                }
//        }
        
        ServiceLayer.request(apiRequest: GetRecipeRequest(), router: .getRecipes, requestObject: "") { (result: Result<[RecipeAPI], APIError>) in
             completion(result)
            }
    }
}
