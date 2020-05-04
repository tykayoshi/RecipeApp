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
    func removeEssential(itemName: String)
}

protocol ShoppingEssentialsViewProtocol: class {
    func getEssentialsList(essentialsList: [String]) 
    
}

protocol ShoppingEssentialsInteractorProtocol: class {
    
}
