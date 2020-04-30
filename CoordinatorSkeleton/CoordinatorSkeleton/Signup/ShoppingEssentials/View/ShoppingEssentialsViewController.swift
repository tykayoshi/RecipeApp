//
//  ShoppingEssentialsViewController.swift
//  RecipeApp
//
//  Created by Rhiannaa on 30/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

class ShoppingEssentialsViewController: UIViewController{
    var presenter: ShoppingEssentialsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        presenter.backButtonPressed()
    }
}

extension ShoppingEssentialsViewController: ShoppingEssentialsViewProtocol {
    
}

extension ShoppingEssentialsViewController {
    static func makeFromStoryboard() -> ShoppingEssentialsViewController {
        let viewController = StoryboardScene.ShoppingEssentials.shoppingEssentialsViewController.instantiate()
        return viewController
    }
}
