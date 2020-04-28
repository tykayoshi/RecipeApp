//
//  RegisterNameViewController.swift
//  RecipeApp
//
//  Created by Rhiannaa on 27/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

class RegisterNameViewController: UIViewController {
    
    var presenter: RegisterNamePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        presenter.backButtonPressed()
    }
}

extension RegisterNameViewController: RegisterNameViewProtocol {
    
}

extension RegisterNameViewController {
    static func makeFromStoryboard() -> RegisterNameViewController {
        let viewController = StoryboardScene.RegisterName.registerNameViewController.instantiate()
        return viewController
    }
}
