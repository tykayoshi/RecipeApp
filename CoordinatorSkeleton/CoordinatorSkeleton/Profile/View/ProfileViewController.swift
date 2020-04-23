//
//  ProfileViewController.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 23/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    var presenter: ProfilePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ProfileViewController: ProfileViewProtocol {
    
}



// Created using Swiftgen in terminal
extension ProfileViewController {
    static func makeFromStoryboard() -> ProfileViewController {
        let viewController = StoryboardScene.Profile.profileViewController.instantiate()
        return viewController
    }
}


