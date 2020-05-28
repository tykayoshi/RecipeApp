//
//  AddRecipePresenter.swift
//  RecipeApp
//
//  Created by Rhiannaa on 28/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

class AddRecipePresenter: AddRecipePresenterProtocol{
    //weak
    var view: AddRecipeViewProtocol?
    var interactor: AddRecipeInteractorProtocol
    weak var coordinator: HomeCoordinatorProtocol?
    
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
}
