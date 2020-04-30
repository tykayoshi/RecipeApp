//
//  RegisterNameContract.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 27/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

protocol RegisterNamePresenterProtocol: class {
    func backButtonPressed()
    func nextButtonPressed()
    func editingEndedWithDetails(userName: String, userAge: String)
}

protocol RegisterNameViewProtocol: class {
    func isNextButtonEnabled(isEnabled: Bool)
}

protocol RegisterNameInteractorProtocol: class {
    
}
