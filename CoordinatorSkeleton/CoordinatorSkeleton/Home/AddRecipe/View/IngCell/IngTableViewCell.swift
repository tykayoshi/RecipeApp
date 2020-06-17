//
//  IngTableViewCell.swift
//  RecipeApp
//
//  Created by Rhiannaa on 17/06/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import UIKit

protocol IngCellProtocol: class {
    func removeIngredient (ingName: String)
}

class IngTableViewCell: UITableViewCell {

    weak var delegate: IngCellProtocol?
    @IBOutlet weak var ingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func removeIngredient(_ sender: Any) {
        guard let ingName = ingLabel.text else {return}
        delegate?.removeIngredient(ingName: ingName)
    }
    
}
