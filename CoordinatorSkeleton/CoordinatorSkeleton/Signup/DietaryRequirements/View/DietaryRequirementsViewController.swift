//
//  DietaryRequirementsViewController.swift
//  RecipeApp
//
//  Created by Natalie Adeyinka on 29/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

class DietaryRequirementsViewController: UIViewController {
    
    var presenter: DietaryRequirementsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        presenter.backButtonPressed()
    }
    
}

extension DietaryRequirementsViewController: DietaryRequirementsViewProtocol {
    
}

extension DietaryRequirementsViewController {
    static func makeFromStoryboard() -> DietaryRequirementsViewController {
        let viewController = StoryboardScene.DietaryRequirements.dietaryRequirementsViewController.instantiate()
        return viewController
    }
}
