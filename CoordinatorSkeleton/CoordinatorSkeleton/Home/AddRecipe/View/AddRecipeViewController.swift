//
//  AddRecipeViewController.swift
//  RecipeApp
//
//  Created by Rhiannaa on 28/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

class AddRecipeViewController: UIViewController{
    var presenter: AddRecipePresenterProtocol!
    @IBOutlet weak var recipeCardView: UIView!
    @IBOutlet weak var recipeInfoView: UIView!
    @IBOutlet weak var ingTitleView: UIView!
    @IBOutlet weak var stepsTitleView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeCardView.curveEdges()
        recipeInfoView.curveEdges()
        ingTitleView.curveEdges()
        stepsTitleView.curveEdges()
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        presenter.cancelButtonPressed()
    }
}

extension AddRecipeViewController: AddRecipeViewProtocol{
    
}

extension AddRecipeViewController {
    static func makeFromStoryboard() -> AddRecipeViewController {
        let viewController = StoryboardScene.AddRecipe.addRecipeViewController.instantiate()
        return viewController
    }
}
