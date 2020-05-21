//
//  RecipeDetailsViewController.swift
//  RecipeApp
//
//  Created by Natalie Adeyinka on 19/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

class RecipeDetailsViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var presenter: RecipeDetailsPresenterProtocol!
    
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var titleCardView: UIView!
    @IBOutlet weak var recipeNameLbl: UILabel!
    @IBOutlet weak var recipeTypeLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var personLbl: UILabel!
    @IBOutlet weak var difficultyLbl: UILabel!
    @IBOutlet weak var recipeInfoView: UIView!
    
    @IBOutlet weak var ingTitleView: UIView!
    
    var recipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleCardView.curveEdges()
        recipeInfoView.curveEdges()
        ingTitleView.curveEdges()
                
        presenter.displayRecipe()
        
        recipeNameLbl.text = recipe?.name
        recipeTypeLbl.text = "Meal"
        timeLbl.text = recipe?.timeToCook
        recipeImg.image = UIImage(named: recipe!.image)
        personLbl.text = String(recipe!.people)
        difficultyLbl.text = recipe?.difficulty
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
        
        scrollView.delegate = self
    }
    
}

extension RecipeDetailsViewController: RecipeDetailsViewProtocol {
    func getRecipeSelected(recipe: Recipe){
        self.recipe = recipe
    }
}

extension RecipeDetailsViewController {
    static func makeFromStoryboard() -> RecipeDetailsViewController {
        let viewController = StoryboardScene.RecipeDetails.recipeDetailsViewController.instantiate()
        return viewController
    }
}
