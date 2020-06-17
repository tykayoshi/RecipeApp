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
    
    var ingList = [String]()
    var stepsList = [String]()
    
    @IBOutlet weak var recipeCardView: UIView!
    @IBOutlet weak var recipeInfoView: UIView!
    @IBOutlet weak var ingTitleView: UIView!
    @IBOutlet weak var stepsTitleView: UIView!
    @IBOutlet weak var ingTextField: RATextField!
    @IBOutlet weak var ingTableView: UITableView!
    @IBOutlet weak var stepsTextField: RATextField!
    @IBOutlet weak var stepsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeCardView.curveEdges()
        recipeInfoView.curveEdges()
        ingTitleView.curveEdges()
        stepsTitleView.curveEdges()
        
        let ingNib = UINib(nibName: String(describing: IngTableViewCell.self), bundle: nil)
        ingTableView?.register(ingNib, forCellReuseIdentifier: String(describing: IngTableViewCell.self))
        
        let stepsNib = UINib(nibName: String(describing: StepsTableViewCell.self), bundle: nil)
        stepsTableView?.register(stepsNib, forCellReuseIdentifier: String(describing: StepsTableViewCell.self))
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        presenter.cancelButtonPressed()
    }
    
    @IBAction func ingAddButtonPressed(_ sender: Any) {
        let ingName = ingTextField.text
        if (ingName?.isEmpty == false){
            presenter.ingAddButtonPressed(ingName: ingName!)
            textFieldShouldClear(ingTextField)
        }
    }
    
    @IBAction func stepsAddButtonPressed(_ sender: Any) {
        let step = stepsTextField.text
        if (step?.isEmpty == false){
            presenter.stepAddButtonPressed(step: step!)
            textFieldShouldClear(stepsTextField)
        }
    }
    
    @IBAction func addRecipeButtonPressed(_ sender: Any) {
        print("Add Recipe Button Pressed")
    }
    
    func textFieldShouldClear(_ textField: UITextField) {
      textField.text!.removeAll()
    }
}

extension AddRecipeViewController: AddRecipeViewProtocol{
    func getIngredientsList(ingList: [String]){
        self.ingList = ingList
        ingTableView.reloadData()
    }
    
    func getStepsList(stepsList: [String]){
        self.stepsList = stepsList
        stepsTableView.reloadData()
    }
}

extension AddRecipeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int?
                
        if (tableView == self.ingTableView){
            count = ingList.count
        }
                
        if (tableView == self.stepsTableView){
            count = stepsList.count
        }
                
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var ingCell = tableView.dequeueReusableCell(withIdentifier: String(describing: IngTableViewCell.self), for: indexPath) as! IngTableViewCell
        var stepCell = tableView.dequeueReusableCell(withIdentifier: String(describing: StepsTableViewCell.self), for: indexPath) as! StepsTableViewCell
        
        if (tableView == self.ingTableView){
            ingCell.ingLabel.text = ingList[indexPath.row]
            return ingCell
        }
                        
        if (tableView == self.stepsTableView){
            stepCell.stepLabel.text = stepsList[indexPath.row]
            return stepCell
        }
        
        return UITableViewCell()
    }
}

extension AddRecipeViewController: IngCellProtocol{
    func removeIngredient(ingName: String) {
        presenter.removeIngredient(ingName: ingName)
    }
}


extension AddRecipeViewController {
    static func makeFromStoryboard() -> AddRecipeViewController {
        let viewController = StoryboardScene.AddRecipe.addRecipeViewController.instantiate()
        return viewController
    }
}
