//
//  RecipeDetailsPresenter.swift
//  RecipeApp
//
//  Created by Natalie Adeyinka on 19/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

class RecipeDetailsPresenter: RecipeDetailsPresenterProtocol {
    
    weak var view: RecipeDetailsViewProtocol?
    var interactor: RecipeDetailsInteractorProtocol
    weak var coordinator: HomeCoordinatorProtocol?
    var recipe: RecipeAPI
    
    init(view: RecipeDetailsViewProtocol, interactor: RecipeDetailsInteractorProtocol, coordinator: HomeCoordinatorProtocol, recipe: RecipeAPI) {
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
        self.recipe = recipe
    }
    
    func displayRecipe(){
        view?.getRecipeSelected(recipe: recipe)
    }
    
    func backButtonPressed(){
        coordinator?.popBackScreen(showTabBar: true)
    }
}
