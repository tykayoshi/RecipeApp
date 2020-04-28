//
//  SignupPresenter.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 27/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol {
    
    weak var view: SignupViewProtocol?
    var interactor: SignupInteractorProtocol
    weak var coordinator: SignupCoordinatorProtocol?
    
    init(view: SignupViewProtocol,
         interactor: SignupInteractorProtocol,
         coordinator: SignupCoordinatorProtocol) {
        
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
    func signupButtonPressed() {
        // Tell Coordinator I've been pressed
        // Show whatever view you need to show
        coordinator?.showRegisterName()
    }
}
