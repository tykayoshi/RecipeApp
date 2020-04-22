//
//  SettingsViewController.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 22/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    var presenter: SettingsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension SettingsViewController: SettingsViewProtocol {
    
}



// Created using Swiftgen in terminal
extension SettingsViewController {
    static func makeFromStoryboard() -> SettingsViewController {
        let viewController = StoryboardScene.Settings.settingsViewController.instantiate()
        return viewController
    }
}

