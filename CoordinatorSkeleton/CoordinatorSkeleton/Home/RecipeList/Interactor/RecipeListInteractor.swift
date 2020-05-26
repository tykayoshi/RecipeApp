//
//  RecipeListInteractor.swift
//  RecipeApp
//
//  Created by Natalie Adeyinka on 13/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation


class RecipeListInteractor: RecipeListInteractorProtocol {
    func getRecipeList(completion: @escaping (Result<[String: [RecipeAPI]], Error>) -> Void) {
            ServiceLayer.request(router: Router.getRecipes) { (result: Result<[String: [RecipeAPI]], Error>) in
                    switch result {
                    case .success:
                        completion(result)
                    case .failure:
                        completion(result)
                    }
            }
    }
    
    func getRecipeList2(completion: @escaping (Result<Recipes, Error>) -> Void) {
        ServiceLayer.request(router: Router.getRecipes) { (result: Result<Recipes, Error>) in
                switch result {
                case .success:
                    completion(result)
                case .failure:
                    completion(result)
                }
        }

    }
}
