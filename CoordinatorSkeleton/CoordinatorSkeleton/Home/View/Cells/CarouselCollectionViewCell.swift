//
//  CarouselCollectionViewCell.swift
//  RecipeApp
//
//  Created by Natalie Adeyinka on 07/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeNameLbl: UILabel!
    @IBOutlet weak var recipeTypeLbl: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
   

}
