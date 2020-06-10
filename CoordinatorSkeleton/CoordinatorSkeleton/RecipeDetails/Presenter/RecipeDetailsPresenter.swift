//
//  RecipeDetailsPresenter.swift
//  RecipeApp
//
//  Created by Natalie Adeyinka on 19/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

class RecipeDetailsPresenter: RecipeDetailsPresenterProtocol {
    
    weak var view: RecipeDetailsViewProtocol?
    var interactor: RecipeDetailsInteractorProtocol
    weak var coordinator: HomeCoordinatorProtocol?
    var recipe: RecipeAPI
    var recipeImage: UIImage
    
    init(view: RecipeDetailsViewProtocol, interactor: RecipeDetailsInteractorProtocol, coordinator: HomeCoordinatorProtocol, recipe: RecipeAPI, image: UIImage) {
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
        self.recipe = recipe
        self.recipeImage = image
    }
    
    func displayRecipe(){
        view?.getRecipeSelected(recipe: recipe, image: recipeImage)
    }
    
    func backButtonPressed(){
        coordinator?.popBackScreen(showTabBar: true)
    }
}
