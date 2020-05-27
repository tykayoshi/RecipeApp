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
    
    @IBOutlet weak var stepsTitleView: UIView!
    @IBOutlet weak var ingredientsTableView: UITableView!
    @IBOutlet weak var stepsTableView: UITableView!
    
    var recipe: RecipeAPI?
    
    var indicies: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleCardView.curveEdges()
        recipeInfoView.curveEdges()
        ingTitleView.curveEdges()
        stepsTitleView.curveEdges()
                
        presenter.displayRecipe()
        
        recipeNameLbl.text = recipe?.name
        recipeTypeLbl.text = "Meal"
        timeLbl.text = String(recipe!.timeToCook) + " hrs"
        recipeImg.image = UIImage(named: "pumpkin")
        personLbl.text = String(recipe!.people)
        
        if (String(recipe!.difficulty) == "1") {
            difficultyLbl.text = "Easy"
        }
        
        if (String(recipe!.difficulty) == "2") {
            difficultyLbl.text = "Medium"
        }
        
        if (String(recipe!.difficulty) == "3") {
            difficultyLbl.text = "Hard"
        }
        
        indicies = recipe!.ingredients.keys.sorted()
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
        
        scrollView.delegate = self
    }
    
}

extension RecipeDetailsViewController: RecipeDetailsViewProtocol {
    func getRecipeSelected(recipe: RecipeAPI){
        self.recipe = recipe
    }
}

extension RecipeDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int?
        
        if (tableView == self.ingredientsTableView) {
            count = recipe?.ingredients.count
        }
        
        if (tableView == self.stepsTableView) {
            count = recipe?.steps.count
        }
        
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        
        if (tableView == self.ingredientsTableView) {
            cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath)
            
            cell!.textLabel!.text = (recipe?.ingredients[indicies[indexPath.row]]!)! + "  " +  indicies[indexPath.row]
        }
        
        if (tableView == self.stepsTableView) {
            cell = tableView.dequeueReusableCell(withIdentifier: "stepCell", for: indexPath)
            
            cell!.textLabel!.text = recipe?.steps[indexPath.row]
        }
        
        return cell!
    }
    
    
}

extension RecipeDetailsViewController {
    static func makeFromStoryboard() -> RecipeDetailsViewController {
        let viewController = StoryboardScene.RecipeDetails.recipeDetailsViewController.instantiate()
        return viewController
    }
}
