//
//  RhiannaaViewController.swift
//  RecipeApp
//
//  Created by Rhiannaa on 22/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

class RhiannaaViewController: UIViewController {
    
    var presenter: RhiannaaPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension RhiannaaViewController: RhiannaaViewProtocol {
    
}



// Created using Swiftgen in terminal
extension RhiannaaViewController {
    static func makeFromStoryboard() -> RhiannaaViewController {
        let viewController = StoryboardScene.Rhiannaa.rhiannaaViewController.instantiate()
        return viewController
    }
}

