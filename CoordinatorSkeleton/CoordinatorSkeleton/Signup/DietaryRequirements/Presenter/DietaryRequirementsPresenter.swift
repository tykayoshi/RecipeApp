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
    
    var dietaryReq: [String] = []
    
    init(view: DietaryRequirementsViewProtocol, interactor: DietaryRequirementsInteractorProtocol, coordinator: SignupCoordinatorProtocol, currentUser: UserManager) {
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
        self.currentUser = currentUser
        
    }
    
    func backButtonPressed() {
        coordinator?.popBackScreen()
    }
    
    func nextButtonPressed(){
        currentUser.dietaryReq = dietaryReq
        print(currentUser.dietaryReq)
    }
    
    func dietaryPressed(option: String){
        dietaryReq.append(option)
    }
}
