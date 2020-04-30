//
//  ShoppingEssentialsPresenter.swift
//  RecipeApp
//
//  Created by Rhiannaa on 30/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

class ShoppingEssentialsPresenter: ShoppingEssentialsPresenterProtocol {
    
    weak var view: ShoppingEssentialsViewProtocol?
    var interactor: ShoppingEssentialsInteractorProtocol
    weak var coordinator: SignupCoordinatorProtocol?
    var currentUser = UserManager.shared
    
    init(view: ShoppingEssentialsViewProtocol, interactor: ShoppingEssentialsInteractorProtocol, coordinator: SignupCoordinatorProtocol, currentUser: UserManager) {
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
        self.currentUser = currentUser
        
    }

    func backButtonPressed(){
        coordinator?.popBackScreen()
    }
}
