//
//  HomePresenter.swift
//  CoordinatorSkeleton
//
//  Created by Ilkay Hamit on 16/09/2019.
//  Copyright © 2019 Ilkay Hamit. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol
    weak var coordinator: HomeCoordinatorProtocol?
    var currentUser = UserManager.shared
    
    init(view: HomeViewProtocol,
         interactor: HomeInteractorProtocol,
         coordinator: HomeCoordinatorProtocol, currentUser: UserManager) {
        
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
        self.currentUser = currentUser
    }
    
    func BrowseAllRecipesBtnPressed() {
        print("pressed browse all")
        coordinator?.showRecipeList()
    }
}
