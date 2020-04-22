//
//  RhiannaaPresenter.swift
//  RecipeApp
//
//  Created by Rhiannaa on 22/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

class RhiannaaPresenter: RhiannaaPresenterProtocol {
    
    weak var view: RhiannaaViewProtocol?
    var interactor: RhiannaaInteractorProtocol
    weak var coordinator: RhiannaaCoordinatorProtocol?
    
    init(view: RhiannaaViewProtocol,
         interactor: RhiannaaInteractorProtocol,
         coordinator: RhiannaaCoordinatorProtocol) {
        
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
}
