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
    //var currentUser = UserManager.shared.currentUser!
    
    init(view: ProfileViewProtocol,
         interactor: ProfileInteractorProtocol,
         coordinator: ProfileCoordinatorProtocol) {
        
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
//    func passCurrentUser() {
//        self.view?.getCurrentUser(user: currentUser)
//    }
    
    func getProfileFromAPI() {
        interactor.getProfile { (result) in
            switch result {
            case .success(let values):
                self.view?.getProfile(result: values)
            case .failure(let error):
                print("error")
            }
        }
    }
}
