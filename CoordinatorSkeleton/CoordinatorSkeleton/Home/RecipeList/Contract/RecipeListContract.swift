//
//  RecipeListContract.swift
//  RecipeApp
//
//  Created by Natalie Adeyinka on 13/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

protocol RecipeListPresenterProtocol: class {
    func backButtonPressed()
    func recipeSelected(recipe: Recipe)
    func getRecipeFromAPI()

}

protocol RecipeListInteractorProtocol: class {
    func getRecipeList(completion: @escaping (Result<[String: [RecipeAPI]], Error>) -> Void)
    func getRecipeList2(completion: @escaping (Result<Recipes, Error>) -> Void)
}

protocol RecipeListViewProtocol: class {
    func getRecipe(result: Result<[String: [RecipeAPI]], Error>)
}
