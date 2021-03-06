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
        
//        print(UserManager.shared.userName)
//        print(UserManager.shared.userAge)
//        print(UserManager.shared.dietaryReq)
//        print(UserManager.shared.essentialList)
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
