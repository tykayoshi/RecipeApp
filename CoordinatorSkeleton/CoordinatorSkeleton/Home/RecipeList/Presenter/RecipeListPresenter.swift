//
//  RecipeListPresenter.swift
//  RecipeApp
//
//  Created by Natalie Adeyinka on 13/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

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
        coordinator?.popBackScreen(showTabBar: false)
    }
    
    func getRecipeFromAPI() {
        interactor.getRecipeList { (result) in
            switch result {
            case .success(let values):
                Helper.saveJsonToDocumentDirectory(object: values, fileName: FileConstants.RECIPELIST)
                self.view?.getRecipe(result: values.recipes)
            case .failure(let error):
                if Helper.isJsonAvailable(fileName: FileConstants.RECIPELIST) {
                    if let recipes = Helper.readRecipeFromDocumentDirectory(fileName: FileConstants.RECIPELIST) {
                        self.view?.getRecipe(result: recipes.recipes)
                    }
                } else {
                    print(error)
                }
            }
        }
    }

    
    func recipeSelected(recipe: RecipeAPI, image: UIImage){
        coordinator?.showRecipeDetail(recipe: recipe, image: image)
    }
}
