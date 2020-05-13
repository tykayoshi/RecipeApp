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
    weak var coordinator: RecipeListCoordinatorProtocol?
    
    init(view: RecipeListViewProtocol,
         interactor: RecipeListInteractorProtocol,
         coordinator: RecipeListCoordinatorProtocol) {
        
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
    }
}
