//
//  AddRecipePresenter.swift
//  RecipeApp
//
//  Created by Rhiannaa on 28/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

class AddRecipePresenter: AddRecipePresenterProtocol{
   
    var view: AddRecipeViewProtocol?
    var interactor: AddRecipeInteractorProtocol
    weak var coordinator: HomeCoordinatorProtocol?
    
    var ingredients = [String]()
    var steps = [String]()
    
    init(view: AddRecipeViewProtocol,
         interactor: AddRecipeInteractorProtocol,
         coordinator: HomeCoordinatorProtocol) {
        
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
    func cancelButtonPressed(){
        coordinator?.popBackScreen(showTabBar: false)
    }
    
    func ingAddButtonPressed(ingName: String){
        ingredients.append(ingName)
        view?.getIngredientsList(ingList: ingredients)
        print(ingredients)
    }
    
    func removeIngredient(ingName: String) {
        if let index = ingredients.index(of: ingName) {
            ingredients.remove(at: index)
            view?.getIngredientsList(ingList: ingredients)
            print("ing remove")
        }
    }
    
    func removeStep(step: String) {
        if let index = steps.index(of: step) {
            steps.remove(at: index)
            view?.getStepsList(stepsList: steps)
            print(steps)
        }
    }
    
    func stepAddButtonPressed(step: String){
        steps.append(step)
        view?.getStepsList(stepsList: steps)
        print (steps)
    }
    
    func addRecipeButtonPressed() {
        print("add recipe pressed presenter")
    }
    
}
