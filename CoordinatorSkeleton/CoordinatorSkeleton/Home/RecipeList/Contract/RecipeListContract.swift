//
//  RecipeListContract.swift
//  RecipeApp
//
//  Created by Natalie Adeyinka on 13/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

protocol RecipeListPresenterProtocol: class {
    func backButtonPressed()
    func recipeSelected(recipe: RecipeAPI, image: UIImage)
    func getRecipeFromAPI()
    func searchRecipes(searchValue: String) -> [RecipeAPI]

}

protocol RecipeListInteractorProtocol: class {
    func getRecipeList(completion: @escaping (Result<Recipes, Error>) -> Void)
}

protocol RecipeListViewProtocol: class {
    func getRecipe(result: [RecipeAPI])
}
