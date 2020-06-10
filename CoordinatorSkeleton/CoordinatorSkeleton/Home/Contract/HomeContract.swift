//
//  HomeContract.swift
//  CoordinatorSkeleton
//
//  Created by Ilkay Hamit on 16/09/2019.
//  Copyright © 2019 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

protocol HomeCoordinatorProtocol: class {
    func showRecipeList()
    func popBackScreen(showTabBar: Bool)
    func showRecipeDetail(recipe:RecipeAPI, image: UIImage)
    func showAddRecipe()
}

protocol HomePresenterProtocol: class {
    func BrowseAllRecipesBtnPressed()
    func addRecipeButtonPressed()
    
}

protocol HomeViewProtocol: class {
    
}

protocol HomeInteractorProtocol: class {
    
}
