//
//  DietaryRequirementsPresenter.swift
//  RecipeApp
//
//  Created by Natalie Adeyinka on 29/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

class DietaryRequirementsPresenter: DietaryRequirementsPresenterProtocol {
    
    weak var view: DietaryRequirementsViewProtocol?
    var interactor: DietaryRequirementsInteractorProtocol
    weak var coordinator: SignupCoordinatorProtocol?
    var currentUser = UserManager.shared
    
    init(view: DietaryRequirementsViewProtocol, interactor: DietaryRequirementsInteractorProtocol, coordinator: SignupCoordinatorProtocol, currentUser: UserManager) {
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
        self.currentUser = currentUser
        
    }
    
    func backButtonPressed() {
        coordinator?.popBackScreen()
    }
}
