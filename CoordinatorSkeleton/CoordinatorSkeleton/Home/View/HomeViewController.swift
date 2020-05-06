//
//  HomeViewController.swift
//  CoordinatorSkeleton
//
//  Created by Ilkay Hamit on 16/09/2019.
//  Copyright © 2019 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    var presenter: HomePresenterProtocol!

    @IBOutlet weak var buttonMeal: UIButton!
    @IBOutlet weak var buttonSalad: UIButton!
    @IBOutlet weak var buttonDrink: UIButton!
    @IBOutlet weak var buttonDessert: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonMeal.alignImageAndTitleVertically()
        buttonDrink.alignImageAndTitleVertically()
        buttonSalad.alignImageAndTitleVertically()
        buttonDessert.alignImageAndTitleVertically()
    }
    
}

extension HomeViewController: HomeViewProtocol {
    
}


extension HomeViewController {
    static func makeFromStoryboard() -> HomeViewController {
        let viewController = StoryboardScene.Home.homeViewController.instantiate()
        return viewController
    }
}
