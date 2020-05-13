//
//  RecipeListViewController.swift
//  RecipeApp
//
//  Created by Natalie Adeyinka on 13/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

class RecipeListViewController: UIViewController {
    
    var presenter: RecipeListPresenterProtocol!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    }
}

extension RecipeListViewController: RecipeListViewProtocol {
    
}

extension RecipeListViewController {
    static func makeFromStoryboard() -> RecipeListViewController {
        let viewController = StoryboardScene.RecipeList.recipeListViewController.instantiate()
        return viewController
    }
}
