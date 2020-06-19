//
//  IngTableViewCell.swift
//  RecipeApp
//
//  Created by Rhiannaa on 17/06/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import UIKit

protocol IngCellProtocol: class {
    func removeIngredient(ingName: String)
}

class IngTableViewCell: UITableViewCell {
    @IBOutlet weak var ingAmountLbl: UILabel!
    @IBOutlet weak var ingLable: UILabel!
    
    
    
    weak var delegate: IngCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func removeIngButtonPressed(_ sender: Any) {
        guard let ingName = ingLable.text else {
            return
        }
        delegate?.removeIngredient(ingName: ingName)
    }
}
