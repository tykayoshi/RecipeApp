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
    
    init(view: HomeViewProtocol,
         interactor: HomeInteractorProtocol,
         coordinator: HomeCoordinatorProtocol) {
        
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
    }
}
