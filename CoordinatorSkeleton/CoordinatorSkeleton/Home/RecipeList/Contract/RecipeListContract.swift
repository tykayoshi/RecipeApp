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

}

protocol RecipeListInteractorProtocol: class {
    
}

protocol RecipeListViewProtocol: class {
    
}
