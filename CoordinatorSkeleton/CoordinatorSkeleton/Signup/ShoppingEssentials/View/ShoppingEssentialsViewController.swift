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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shoppingListNib = UINib(nibName: String(describing: ShoppingEssentialsTableViewCell.self), bundle: nil)
        tableView?.register(shoppingListNib, forCellReuseIdentifier: String(describing: ShoppingEssentialsTableViewCell.self))
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        presenter.backButtonPressed()
    }
}

extension ShoppingEssentialsViewController: ShoppingEssentialsViewProtocol {
    
}


extension ShoppingEssentialsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ShoppingEssentialsTableViewCell.self), for: indexPath) as! ShoppingEssentialsTableViewCell
    
        cell.shoppingLabel.text = "Shopping"
        
        return cell
    }
}

extension ShoppingEssentialsViewController {
    static func makeFromStoryboard() -> ShoppingEssentialsViewController {
        let viewController = StoryboardScene.ShoppingEssentials.shoppingEssentialsViewController.instantiate()
        return viewController
    }
}
