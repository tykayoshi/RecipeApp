//
//  ShoppingEssentialsViewController.swift
//  RecipeApp
//
//  Created by Rhiannaa on 30/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

class ShoppingEssentialsViewController: UIViewController {
    var presenter: ShoppingEssentialsPresenterProtocol!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var essentialsTextField: RATextField!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    var essentialsList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldPadding(textField: essentialsTextField)
        
        let shoppingListNib = UINib(nibName: String(describing: ShoppingEssentialsTableViewCell.self), bundle: nil)
        tableView?.register(shoppingListNib, forCellReuseIdentifier: String(describing: ShoppingEssentialsTableViewCell.self))
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(with:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(with:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
    }
    
    func textFieldPadding(textField: RATextField) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = UITextField.ViewMode.always
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
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        presenter.backButtonPressed()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let itemName = essentialsTextField.text
        if (itemName?.isEmpty == false) {
            presenter.addButtonPressed(itemName: itemName!)
            textFieldShouldClear(essentialsTextField)
        }

    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        presenter.nextButtonPressed()
    }
    
    func textFieldShouldClear(_ textField: UITextField) {
      textField.text!.removeAll()
    }
}


extension ShoppingEssentialsViewController: ShoppingEssentialsViewProtocol {
    func getEssentialsList(essentialsList: [String]) {
        self.essentialsList = essentialsList
        tableView.reloadData()
    }
}


extension ShoppingEssentialsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return essentialsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ShoppingEssentialsTableViewCell.self), for: indexPath) as! ShoppingEssentialsTableViewCell
    
        cell.shoppingLabel.text = essentialsList[indexPath.row]
        cell.delegate = self
        
        return cell
    }
}

extension ShoppingEssentialsViewController: ShoppingListCellProtocol {
    func removeEssential(itemName: String) {
        presenter.removeEssential(itemName: itemName)
    }
}

extension ShoppingEssentialsViewController {
    static func makeFromStoryboard() -> ShoppingEssentialsViewController {
        let viewController = StoryboardScene.ShoppingEssentials.shoppingEssentialsViewController.instantiate()
        return viewController
    }
}
