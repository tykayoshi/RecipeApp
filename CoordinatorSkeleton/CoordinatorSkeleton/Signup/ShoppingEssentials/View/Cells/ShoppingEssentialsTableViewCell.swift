//
//  ShoppingEssentialsTableViewCell.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 01/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import UIKit

protocol ShoppingListCellProtocol: class {
    func removeEssential(itemName: String)
}

class ShoppingEssentialsTableViewCell: UITableViewCell {
    
    weak var delegate: ShoppingListCellProtocol?
    @IBOutlet weak var shoppingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func removeEssential(_ sender: Any) {
        guard let itemName = shoppingLabel.text else { return }
        delegate?.removeEssential(itemName: itemName)
    }
}
