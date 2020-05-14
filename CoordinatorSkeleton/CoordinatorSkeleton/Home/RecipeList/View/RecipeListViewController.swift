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
    var recipes: [Recipe] = [Recipe(name:"Pumpkin Pie", timeToCook: "2hrs", difficulty: "hard", image: "pumpkin", people: 2), Recipe(name:"Potato Smiles", timeToCook: "1hrs", difficulty: "easy", image: "smilies", people: 3), Recipe(name:"Buffalo Wings", timeToCook: "1.5hrs", difficulty: "medium", image: "wings", people: 4)]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recipeListNib = UINib(nibName: String(describing: RecipeTableViewCell.self), bundle: nil)
        tableView?.register(recipeListNib, forCellReuseIdentifier: String(describing: RecipeTableViewCell.self))
    }
    
    
    
}

extension RecipeListViewController: RecipeListViewProtocol {
    
}

extension RecipeListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecipeTableViewCell.self), for: indexPath) as! RecipeTableViewCell
        
        let recipe = recipes[indexPath.row]
    
        cell.recipeNameLbl.text = recipe.name
        cell.recipeTypeLbl.text = "Meal"
        cell.timeLbl.text = recipe.timeToCook
        cell.recipeImage.image = UIImage(named: recipe.image)
        cell.personLbl.text = String(recipe.people)
        cell.difficultyLbl.text = recipe.difficulty
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 258
    }
    
}

extension RecipeListViewController {
    static func makeFromStoryboard() -> RecipeListViewController {
        let viewController = StoryboardScene.RecipeList.recipeListViewController.instantiate()
        return viewController
    }
}
