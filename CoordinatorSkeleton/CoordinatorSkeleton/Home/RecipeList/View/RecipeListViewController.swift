//
//  RecipeListViewController.swift
//  RecipeApp
//
//  Created by Natalie Adeyinka on 13/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class RecipeListViewController: UIViewController {
    
    var presenter: RecipeListPresenterProtocol!
    
    var recipeAPI = [RecipeAPI]()
    var filteredRecipe = [RecipeAPI]()
    var searching = false
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchRecipe: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.getRecipeFromAPI()
                
        let recipeListNib = UINib(nibName: String(describing: RecipeTableViewCell.self), bundle: nil)
        tableView?.register(recipeListNib, forCellReuseIdentifier: String(describing: RecipeTableViewCell.self))
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
        
        
        if let textfield = searchRecipe.value(forKey: "searchField") as? UITextField {
            textfield.backgroundColor = UIColor.white
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        presenter.backButtonPressed()
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}

extension RecipeListViewController: RecipeListViewProtocol {
    func getRecipe(result: [RecipeAPI]) {
        self.recipeAPI =  result
        reloadTableView()
    }
    
    
}

extension RecipeListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return filteredRecipe.count
        } else {
            return  recipeAPI.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecipeTableViewCell.self), for: indexPath) as! RecipeTableViewCell
        
        if searching {
            let recipe = filteredRecipe[indexPath.row]
            
                cell.recipeNameLbl.text = recipe.name
                cell.recipeTypeLbl.text = recipe.cuisine
                cell.timeLbl.text = String(recipe.timeToCook)
                cell.recipeImage.sd_setImage(with: URL(string: recipe.image), placeholderImage: UIImage(named: "noImage"))
                cell.personLbl.text = String(recipe.people)
                cell.difficultyLbl.text = String(recipe.difficulty)
        } else {
            let recipe = recipeAPI[indexPath.row]
            
                cell.recipeNameLbl.text = recipe.name
                cell.recipeTypeLbl.text = recipe.cuisine
                cell.timeLbl.text = String(recipe.timeToCook)
                cell.recipeImage.sd_setImage(with: URL(string: recipe.image), placeholderImage: UIImage(named: "noImage"))
                cell.personLbl.text = String(recipe.people)
                cell.difficultyLbl.text = String(recipe.difficulty)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 258
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! RecipeTableViewCell
        let recipe: RecipeAPI
        if searching{
            recipe = filteredRecipe[indexPath.row]
        } else{
            recipe = recipeAPI[indexPath.row]
        }
        presenter.recipeSelected(recipe: recipe, image: cell.recipeImage.image!)
        
    }
    
}

extension RecipeListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredRecipe = presenter.searchRecipes(searchValue: searchText)
        searching = true
        tableView.reloadData()
    }
    
}

extension RecipeListViewController {
    static func makeFromStoryboard() -> RecipeListViewController {
        let viewController = StoryboardScene.RecipeList.recipeListViewController.instantiate()
        return viewController
    }
}
