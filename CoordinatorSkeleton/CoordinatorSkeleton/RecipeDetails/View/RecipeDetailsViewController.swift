//
//  RecipeDetailsViewController.swift
//  RecipeApp
//
//  Created by Natalie Adeyinka on 19/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

class RecipeDetailsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension RecipeDetailsViewController: RecipeDetailsViewProtocol {
    
}

extension RecipeDetailsViewController {
    static func makeFromStoryboard() -> RecipeDetailsViewController {
        let viewController = StoryboardScene.RecipeDetails.recipeDetailsViewController.instantiate()
        return viewController
    }
}
