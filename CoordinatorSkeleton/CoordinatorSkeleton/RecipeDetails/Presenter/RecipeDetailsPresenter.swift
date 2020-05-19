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
    
    init(view: RecipeDetailsViewProtocol, interactor: RecipeDetailsInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }
}
