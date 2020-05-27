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
        interactor.getRecipeList { (result) in
            switch result {
            case .success(let values):
                self.view?.getRecipe(result: values.recipes)
            case .failure(let error):
                print("error")
            }
        }
    }

    
    func recipeSelected(recipe: RecipeAPI){
        coordinator?.showRecipeDetail(recipe: recipe)
    }
}
