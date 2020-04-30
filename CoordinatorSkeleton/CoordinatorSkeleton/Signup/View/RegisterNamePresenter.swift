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
    var currentUser = UserManager.shared
    
    init(view: RegisterNameViewProtocol,
         interactor: RegisterNameInteractorProtocol,
         coordinator: SignupCoordinatorProtocol) {
        
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
    func backButtonPressed() {
        coordinator?.popBackScreen()
    }
    
    func editingEndedWithDetails(userName: String, userAge: String) {
        if userName == "" || userAge == "" {
            view?.isNextButtonEnabled(isEnabled: false)
        } else if !userName.isEmpty && !userAge.isEmpty {
            currentUser.userAge = userAge
            currentUser.userName = userName
            view?.isNextButtonEnabled(isEnabled: true)
        }
    }

    
    func nextButtonPressed() {
        coordinator?.showDietaryRequirements(currentUser: currentUser)
        
    }
    
}
