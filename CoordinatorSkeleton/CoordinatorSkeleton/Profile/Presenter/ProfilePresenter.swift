//
//  ProfilePresenter.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 23/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

class ProfilePresenter: ProfilePresenterProtocol {
    
    
    weak var view: ProfileViewProtocol?
    var interactor: ProfileInteractorProtocol
    weak var coordinator: ProfileCoordinatorProtocol?
    
    init(view: ProfileViewProtocol,
         interactor: ProfileInteractorProtocol,
         coordinator: ProfileCoordinatorProtocol) {
        
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
}
