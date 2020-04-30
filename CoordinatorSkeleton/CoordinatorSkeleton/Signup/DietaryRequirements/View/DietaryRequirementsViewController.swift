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
    
    
    @IBOutlet weak var vegetarian: RAButton!
    @IBOutlet weak var vegan: RAButton!
    @IBOutlet weak var glutenFree: RAButton!
    @IBOutlet weak var dairyFree: RAButton!
    @IBOutlet weak var nutFree: RAButton!
    @IBOutlet weak var halal: RAButton!
    @IBOutlet weak var porkFree: RAButton!
    @IBOutlet weak var beefFree: RAButton!
    
    var presenter: DietaryRequirementsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(vegetarian.isSelected)
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        presenter.backButtonPressed()
    }

    @IBAction func nextButtonPressed(_ sender: Any) {
        presenter.nextButtonPressed()
    }
    
    //MARK: Function/Actions for dietary option buttons
    
    @IBAction func vegetarianPressed(_ sender: Any) {
        if vegetarian.isSelected == false{
            vegetarian.isSelected = true
            vegetarian.backgroundColor = UIColor(red: 0.18, green: 0.25, blue: 0.32, alpha: 1.00)
            presenter.dietaryPressed(option: "Vegetarian")
        }
        else{
            vegetarian.isSelected = false
            vegetarian.backgroundColor = UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 1.00)
            presenter.removeDietary(option: "Vegetarian")
        }
    }
    
    @IBAction func veganPressed(_ sender: Any) {
        if vegan.isSelected == false{
            vegan.isSelected = true
            vegan.backgroundColor = UIColor(red: 0.18, green: 0.25, blue: 0.32, alpha: 1.00)
            presenter.dietaryPressed(option: "Vegan")
        }
        else{
            vegan.isSelected = false
            vegan.backgroundColor = UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 1.00)
            presenter.removeDietary(option: "Vegan")
        }
    }
    
    @IBAction func glutenFreePressed(_ sender: Any) {
        if glutenFree.isSelected == false{
            glutenFree.isSelected = true
            glutenFree.backgroundColor = UIColor(red: 0.18, green: 0.25, blue: 0.32, alpha: 1.00)
            presenter.dietaryPressed(option: "Gluten-Free")
        }
        else{
            glutenFree.isSelected = false
            glutenFree.backgroundColor = UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 1.00)
            presenter.removeDietary(option: "Gluten-Free")
        }
    }
    
    @IBAction func dairyFreePressed(_ sender: Any) {
        if dairyFree.isSelected == false{
            dairyFree.isSelected = true
            dairyFree.backgroundColor = UIColor(red: 0.18, green: 0.25, blue: 0.32, alpha: 1.00)
            presenter.dietaryPressed(option: "Dairy-Free")
        }
        else{
            dairyFree.isSelected = false
            dairyFree.backgroundColor = UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 1.00)
            presenter.removeDietary(option: "Dairy-Free")
        }
    }
    
    @IBAction func nutFreePressed(_ sender: Any) {
        if nutFree.isSelected == false{
            nutFree.isSelected = true
            nutFree.backgroundColor = UIColor(red: 0.18, green: 0.25, blue: 0.32, alpha: 1.00)
            presenter.dietaryPressed(option: "Nut-Free")
        }
        else{
            nutFree.isSelected = false
            nutFree.backgroundColor = UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 1.00)
            presenter.removeDietary(option: "Nut-Free")
        }
    }
    
    @IBAction func halalPressed(_ sender: Any) {
        if halal.isSelected == false{
            halal.isSelected = true
            halal.backgroundColor = UIColor(red: 0.18, green: 0.25, blue: 0.32, alpha: 1.00)
            presenter.dietaryPressed(option: "Halal")
        }
        else{
            halal.isSelected = false
            halal.backgroundColor = UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 1.00)
            presenter.removeDietary(option: "Halal")
        }
    }
    
    @IBAction func porkFreePressed(_ sender: Any) {
        if porkFree.isSelected == false{
            porkFree.isSelected = true
            porkFree.backgroundColor = UIColor(red: 0.18, green: 0.25, blue: 0.32, alpha: 1.00)
            presenter.dietaryPressed(option: "Pork-Free")
        }
        else{
            porkFree.isSelected = false
            porkFree.backgroundColor = UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 1.00)
            presenter.removeDietary(option: "Pork-Free")
        }
    }
    
    @IBAction func beefFreePressed(_ sender: Any) {
        if beefFree.isSelected == false{
            beefFree.isSelected = true
            beefFree.backgroundColor = UIColor(red: 0.18, green: 0.25, blue: 0.32, alpha: 1.00)
            presenter.dietaryPressed(option: "Beef-Free")
        }
        else{
            beefFree.isSelected = false
            beefFree.backgroundColor = UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 1.00)
            
            presenter.removeDietary(option: "Beef-Free")
        }
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
