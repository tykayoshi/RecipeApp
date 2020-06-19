//
//  AddRecipePresenter.swift
//  RecipeApp
//
//  Created by Rhiannaa on 28/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

class AddRecipePresenter: AddRecipePresenterProtocol {
    
    var view: AddRecipeViewProtocol?
    var interactor: AddRecipeInteractorProtocol
    weak var coordinator: HomeCoordinatorProtocol?
    
    var ingredients = [String:String]()
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
    
    func ingAddButtonPressed(ingName: String, ingAmount: String){
        ingredients[ingName] = ingAmount
        view?.getIngredientsList(ingList: ingredients)
        print(ingredients)
    }
    
    func removeIngredient(ingName: String) {
        ingredients.removeValue(forKey: ingName)
        view?.getIngredientsList(ingList: ingredients)
        print("ing remove")
        
        
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
    
    
    func postRecipe() {
        let recipe = RecipeAPI(userId: 1, recipeId: "lalala", name: "TestRecipe", ingredients: ["Test1" : "Test11"], steps: ["TestStep"], timeToCook: 1, difficulty: "hard", cuisine: "Test", image: "hello", people: 1)
        
        interactor.postRecipe(using: recipe) { (result) in
            switch result {
            case .success(let recipe):
                print("succes")
            case .failure(let error):
                print("error")
            }
        }

    }
    
    
}
