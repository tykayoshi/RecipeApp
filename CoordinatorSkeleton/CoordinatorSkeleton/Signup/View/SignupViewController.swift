//
//  SignupViewController.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 27/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

class SignupViewController: UIViewController {
    
    var presenter: SignupPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        presenter.signupButtonPressed()
    }
    
}

extension SignupViewController: SignupViewProtocol {

}

extension SignupViewController {
    static func makeFromStoryboard() -> SignupViewController {
        let viewController = StoryboardScene.Signup.signupViewController.instantiate()
        return viewController
    }
}
