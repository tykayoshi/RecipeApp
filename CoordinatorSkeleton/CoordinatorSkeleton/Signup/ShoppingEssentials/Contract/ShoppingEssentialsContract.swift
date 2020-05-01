//
//  ShoppingEssentialsContract.swift
//  RecipeApp
//
//  Created by Rhiannaa on 30/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

protocol ShoppingEssentialsPresenterProtocol: class {
    func backButtonPressed()
    func addButtonPressed(itemName: String)
}

protocol ShoppingEssentialsViewProtocol: class {
    
}

protocol ShoppingEssentialsInteractorProtocol: class {
    
}
