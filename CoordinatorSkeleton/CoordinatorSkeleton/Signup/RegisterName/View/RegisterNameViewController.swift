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
    
    @IBOutlet weak var NameTextField: RATextField!
    @IBOutlet weak var AgeTextField: RATextField!
    @IBOutlet weak var BottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldPadding(textField: NameTextField)
        textFieldPadding(textField: AgeTextField)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(with:)), name: UIResponder.keyboardWillShowNotification, object: nil)

    }
    
    @objc func keyboardWillShow(with notification: Notification) {
        let key = "UIKeyboardFrameEndUserInfoKey"
        guard let keyboardFrame = notification.userInfo?[key] as? NSValue else {return}
        
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        BottomConstraint.constant = keyboardHeight
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldPadding(textField: RATextField!) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = UITextField.ViewMode.always
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
