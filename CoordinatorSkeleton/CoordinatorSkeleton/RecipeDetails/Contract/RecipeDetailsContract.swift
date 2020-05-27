//
//  RecipeDetailsContract.swift
//  RecipeApp
//
//  Created by Natalie Adeyinka on 19/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

protocol RecipeDetailsPresenterProtocol: class {
    func displayRecipe()
}

protocol RecipeDetailsViewProtocol: class {
    func getRecipeSelected(recipe: RecipeAPI)
}

protocol RecipeDetailsInteractorProtocol: class {
    
}
