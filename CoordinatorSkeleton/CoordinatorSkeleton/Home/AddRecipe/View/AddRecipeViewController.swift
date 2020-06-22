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
    
    var ingList: [String:String] = [:]
    var stepsList = [String]()
    var indicies = [String]()
    
    @IBOutlet weak var recipeCardView: UIView!
    @IBOutlet weak var recipeInfoView: UIView!
    @IBOutlet weak var ingTitleView: UIView!
    @IBOutlet weak var stepsTitleView: UIView!
    @IBOutlet weak var ingTextField: RATextField!
    @IBOutlet weak var ingTableView: UITableView!
    @IBOutlet weak var stepsTextField: RATextField!
    @IBOutlet weak var stepsTableView: UITableView!
    
   
    @IBOutlet weak var recipeNameTextField: UITextField!
    @IBOutlet weak var recipeTypeTextField: UITextField!
    @IBOutlet weak var timeToCookTextField: UITextField!
    @IBOutlet weak var peopleTextField: UITextField!
    @IBOutlet weak var difficultyTextField: UITextField!
    @IBOutlet weak var ingAmountTextField: RATextField!
    
    @IBOutlet weak var addRecipeButton: RAButton!
    
    
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
        
        addRecipeButton.isEnabled = false
        addRecipeButton.alpha = 0.5
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
           view.endEditing(true)
       }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        presenter.cancelButtonPressed()
    }
    
    @IBAction func ingAddButtonPressed(_ sender: Any) {
        let ingName = ingTextField.text
        let ingAmount = ingAmountTextField.text
        if (ingName?.isEmpty == false){
            presenter.ingAddButtonPressed(ingName: ingName!, ingAmount: ingAmount!)
            textFieldShouldClear(ingTextField)
            textFieldShouldClear(ingAmountTextField)
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
        let alert = UIAlertController(title: "Confirm Add Recipe", message: "Do you wish to add this recipe?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {action in self.confirmAddRecipe()}))
        self.present(alert, animated: true)
        
       
    }
    
    func confirmAddRecipe() {
        let recipeName = recipeNameTextField.text!
        let recipeType = recipeTypeTextField.text!
        let time = Int(timeToCookTextField.text!)!
        let person = Int(peopleTextField.text!)!
        let difficulty = difficultyTextField.text!

        let recipe = RecipeAPI(userId: 1, recipeId: "", name: recipeName, ingredients: ingList, steps: stepsList, timeToCook: time, difficulty: difficulty, cuisine: recipeType, image: "image", people: person)
        
        presenter.postRecipe(recipe: recipe)
        presenter.cancelButtonPressed()
    }
    
    func textFieldShouldClear(_ textField: UITextField) {
      textField.text!.removeAll()
    }
    
}

extension AddRecipeViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let recipeName = recipeNameTextField.text,
        let recipeType = recipeTypeTextField.text,
        let time = Int(timeToCookTextField.text!),
        let person = Int(peopleTextField.text!),
        let difficulty = difficultyTextField.text else {return}
        
        presenter.editingEndedWithAddRecipe(recipeName: recipeName, recipeType: recipeType, time: time, person: person, difficulty: difficulty)
    }
}

extension AddRecipeViewController: AddRecipeViewProtocol{
    func getIngredientsList(ingList: [String:String]){
        self.ingList = ingList
        ingTableView.reloadData()
    }
    
    func getStepsList(stepsList: [String]){
        self.stepsList = stepsList
        stepsTableView.reloadData()
    }
    
    func isAddRecipeButtonEnabled(isEnabled: Bool) {
        if isEnabled{
            addRecipeButton.isEnabled = isEnabled
            addRecipeButton.alpha = 1
        } else {
            addRecipeButton.isEnabled = isEnabled
            addRecipeButton.alpha = 0.5
        }
    }
    
    func successAlert() {
        let alert = UIAlertController(title: "Success", message: "Your recipe has been successfully added", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func failureAlert() {
           let alert = UIAlertController(title: "Failure", message: "Your recipe has not been added", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
           self.present(alert, animated: true)
       }
    
}

extension AddRecipeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                
        if (tableView == self.ingTableView){
            return ingList.count
        }
                
        if (tableView == self.stepsTableView){
            return stepsList.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ingredient = Array(ingList.keys)
        
        if (tableView == self.ingTableView) {
            let ingCell = tableView.dequeueReusableCell(withIdentifier: String(describing: IngTableViewCell.self), for: indexPath) as! IngTableViewCell
            ingCell.ingAmountLbl.text = ingList[ingredient[indexPath.row]]!
            ingCell.ingLable.text = ingredient[indexPath.row]
            ingCell.delegate = self
            return ingCell
        }

        if (tableView == self.stepsTableView) {
            let stepCell = tableView.dequeueReusableCell(withIdentifier: String(describing: StepsTableViewCell.self), for: indexPath) as! StepsTableViewCell
            
            stepCell.stepLabel.text = stepsList[indexPath.row]
            stepCell.stepLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            stepCell.stepLabel.numberOfLines = 0

            stepCell.delegate = self
    
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

extension AddRecipeViewController: StepCellProtocol{
    func removeStep(step: String) {
        presenter.removeStep(step: step)
    }
}

extension AddRecipeViewController {
    static func makeFromStoryboard() -> AddRecipeViewController {
        let viewController = StoryboardScene.AddRecipe.addRecipeViewController.instantiate()
        return viewController
    }
}
