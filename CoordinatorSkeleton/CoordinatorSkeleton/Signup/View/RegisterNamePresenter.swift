//
//  RegisterNamePresenter.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 27/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

class RegisterNamePresenter: RegisterNamePresenterProtocol {
    
    weak var view: RegisterNameViewProtocol?
    var interactor: RegisterNameInteractorProtocol
    weak var coordinator: SignupCoordinatorProtocol?
    
    init(view: RegisterNameViewProtocol,
         interactor: RegisterNameInteractorProtocol,
         coordinator: SignupCoordinatorProtocol) {
        
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
}
