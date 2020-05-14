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
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return recipes.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecipeTableViewCell.self), for: indexPath) as! RecipeTableViewCell
    
        cell.recipeNameLbl.text = recipes[indexPath.section].name
        cell.recipeTypeLbl.text = "Meal"
        cell.timeLbl.text = recipes[indexPath.section].timeToCook
        cell.recipeImage.image = UIImage(named: recipes[indexPath.section].image)
        cell.personLbl.text = String(recipes[indexPath.section].people)
        cell.difficultyLbl.text = recipes[indexPath.section].difficulty
        
        return cell
    }

    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(red: 0.18, green: 0.25, blue: 0.32, alpha: 1.00)
        return headerView
    }
}

extension RecipeListViewController {
    static func makeFromStoryboard() -> RecipeListViewController {
        let viewController = StoryboardScene.RecipeList.recipeListViewController.instantiate()
        return viewController
    }
}
