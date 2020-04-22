//
//  SettingsPresenter.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 22/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

class SettingsPresenter: SettingsPresenterProtocol {
    
    weak var view: SettingsViewProtocol?
    var interactor: SettingsInteractorProtocol
    weak var coordinator: SettingsCoordinatorProtocol?
    
    init(view: SettingsViewProtocol,
         interactor: SettingsInteractorProtocol,
         coordinator: SettingsCoordinatorProtocol) {
        
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
}
