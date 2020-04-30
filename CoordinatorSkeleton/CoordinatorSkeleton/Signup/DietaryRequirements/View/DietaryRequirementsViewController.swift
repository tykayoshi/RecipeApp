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
            presenter.dietaryPressed(option: "Vegetarian")
        }
        else{
            vegetarian.isSelected = false
            presenter.removeDietary(option: "Vegetarian")
        }
    }
    
    @IBAction func veganPressed(_ sender: Any) {
        presenter.dietaryPressed(option: "Vegan")
    }
    
    @IBAction func glutenFreePressed(_ sender: Any) {
        presenter.dietaryPressed(option: "Gluten-Free")
    }
    
    @IBAction func dairyFreePressed(_ sender: Any) {
        presenter.dietaryPressed(option: "Diary-Free")
    }
    
    @IBAction func nutFreePressed(_ sender: Any) {
        presenter.dietaryPressed(option: "Nut-Free")
    }
    
    @IBAction func halalPressed(_ sender: Any) {
        presenter.dietaryPressed(option: "Halal")
    }
    
    @IBAction func porkFreePressed(_ sender: Any) {
        presenter.dietaryPressed(option: "Pork-Free")
    }
    
    @IBAction func beefFreePressed(_ sender: Any) {
        presenter.dietaryPressed(option: "Beef-Free")
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
