//
//  RecipeDetailsContract.swift
//  RecipeApp
//
//  Created by Natalie Adeyinka on 19/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

protocol RecipeDetailsPresenterProtocol: class {
    func displayRecipe()
    func backButtonPressed()
}

protocol RecipeDetailsViewProtocol: class {
    func getRecipeSelected(recipe: RecipeAPI, image: UIImage)
}

protocol RecipeDetailsInteractorProtocol: class {
    
}
