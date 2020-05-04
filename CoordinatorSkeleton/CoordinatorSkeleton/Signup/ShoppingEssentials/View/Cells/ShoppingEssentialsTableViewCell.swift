//
//  ShoppingEssentialsTableViewCell.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 01/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import UIKit

class ShoppingEssentialsTableViewCell: UITableViewCell {
    var presenter: ShoppingEssentialsPresenterProtocol!

    @IBOutlet weak var shoppingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func removeEssential(_ sender: Any) {
        presenter.removeEssential(itemName: shoppingLabel.text!)
    }
}
