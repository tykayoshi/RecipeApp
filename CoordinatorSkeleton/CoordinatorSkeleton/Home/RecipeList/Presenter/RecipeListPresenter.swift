//
//  RecipeListPresenter.swift
//  RecipeApp
//
//  Created by Natalie Adeyinka on 13/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

class RecipeListPresenter: RecipeListPresenterProtocol {
    
    weak var view: RecipeListViewProtocol?
    var interactor: RecipeListInteractorProtocol
    weak var coordinator: HomeCoordinatorProtocol?
    
    var recipe: Recipes?
    
    init(view: RecipeListViewProtocol,
         interactor: RecipeListInteractorProtocol,
         coordinator: HomeCoordinatorProtocol) {
        
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
    func backButtonPressed(){
        coordinator?.popBackScreen()
    }
    
    func getRecipeFromAPI() {
        
        // Firstly re-read the code
        // Pass the recipe array from presenter to the view
        // Remember to create the ViewProtocol Method, same as recipe details
        // Replace Recipe object with our RecipeAPI object to get the data from API
        // Add missing paramters in RecipeAPI object
        
        interactor.getRecipeList { result in
            print(result)
//            self.view?.getRecipe(result: result)
            self.recipe = result
        }
        
    }

    
    func recipeSelected(recipe: Recipe){
        coordinator?.showRecipeDetail(recipe: recipe)
    }
}
