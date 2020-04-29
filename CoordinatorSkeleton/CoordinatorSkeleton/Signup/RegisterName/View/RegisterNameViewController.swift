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
    
    @IBOutlet weak var nameTextField: RATextField!
    @IBOutlet weak var ageTextField: RATextField!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var nextButton: RAButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldPadding(textField: nameTextField)
        textFieldPadding(textField: ageTextField)
        
        nextButton.isEnabled = false
        nextButton.alpha = 0.5
                
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(with:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(with:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    
    @objc func keyboardWillShow(with notification: Notification) {
        let key = "UIKeyboardFrameEndUserInfoKey"
        guard let keyboardFrame = notification.userInfo?[key] as? NSValue else {return}
        
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        bottomConstraint.constant = keyboardHeight
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(with notification: Notification) {
        bottomConstraint.constant = 40
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
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        presenter.nextButtonPressed()
    }
    
}

extension RegisterNameViewController: RegisterNameViewProtocol {
    func isNextButtonEnabled(isEnabled: Bool) {
        if isEnabled {
            nextButton.isEnabled = isEnabled
            nextButton.alpha = 1
        } else {
            nextButton.isEnabled = isEnabled
            nextButton.alpha = 0.5
        }
    }
}

extension RegisterNameViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let userName = nameTextField.text, let userAge = ageTextField.text else { return }
        presenter.editingEndedWithDetails(userName: userName, userAge: userAge)
    }
}

extension RegisterNameViewController {
    static func makeFromStoryboard() -> RegisterNameViewController {
        let viewController = StoryboardScene.RegisterName.registerNameViewController.instantiate()
        return viewController
    }
}
