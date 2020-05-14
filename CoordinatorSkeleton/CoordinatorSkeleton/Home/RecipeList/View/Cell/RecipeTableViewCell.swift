//
//  RecipeTableViewCell.swift
//  RecipeApp
//
//  Created by Natalie Adeyinka on 13/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeNameLbl: UILabel!
    @IBOutlet weak var recipeTypeLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var personLbl: UILabel!
    @IBOutlet weak var difficultyLbl: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
     @IBInspectable var cornerRadius: CGFloat = 0 {
         didSet {
             layer.cornerRadius = cornerRadius
         }
     }
}
