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
    
    var recipeAPI = [RecipeAPI]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.getRecipeFromAPI()
        
        let recipeListNib = UINib(nibName: String(describing: RecipeTableViewCell.self), bundle: nil)
        tableView?.register(recipeListNib, forCellReuseIdentifier: String(describing: RecipeTableViewCell.self))
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        presenter.backButtonPressed()
    }
    
    
}

extension RecipeListViewController: RecipeListViewProtocol {
    func getRecipe(result: [RecipeAPI]) {
        self.recipeAPI =  result
        tableView.reloadData()
    }
    
    
}

extension RecipeListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  recipeAPI.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecipeTableViewCell.self), for: indexPath) as! RecipeTableViewCell
        
        let recipe = recipeAPI[indexPath.row]
    
        cell.recipeNameLbl.text = recipe.name
        cell.recipeTypeLbl.text = "Meal"
        cell.timeLbl.text = String(recipe.timeToCook)
        cell.recipeImage.image = UIImage(named: recipe.image)
        cell.personLbl.text = String(recipe.people)
        cell.difficultyLbl.text = String(recipe.difficulty)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 258
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \(indexPath.row)")
        let recipe = recipeAPI[indexPath.row]
        
        // Update this flow with RecipeAPI object
        presenter.recipeSelected(recipe: recipe)
        
    }
    
}

extension RecipeListViewController {
    static func makeFromStoryboard() -> RecipeListViewController {
        let viewController = StoryboardScene.RecipeList.recipeListViewController.instantiate()
        return viewController
    }
}
