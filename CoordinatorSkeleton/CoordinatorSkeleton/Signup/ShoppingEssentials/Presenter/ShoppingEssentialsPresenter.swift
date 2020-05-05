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
    
    var essentials: [String] = []
    
    init(view: ShoppingEssentialsViewProtocol, interactor: ShoppingEssentialsInteractorProtocol, coordinator: SignupCoordinatorProtocol, currentUser: UserManager) {
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
        self.currentUser = currentUser
        
    }

    func backButtonPressed(){
        coordinator?.popBackScreen()
    }
    
    func addButtonPressed(itemName: String) {
        essentials.append(itemName)
        view?.getEssentialsList(essentialsList: essentials)
        print(essentials)
    }
    
    
    func removeEssential(itemName: String){
        if let index = essentials.index(of: itemName) {
            essentials.remove(at: index)
            view?.getEssentialsList(essentialsList: essentials)
            print(essentials)
        }
    }
    
    func nextButtonPressed() {
        currentUser.essentialList = essentials
        print(currentUser.essentialList)
        print("END OF REGISTRATION")
        currentUser.hasCompletedSignup = true
    }
}
