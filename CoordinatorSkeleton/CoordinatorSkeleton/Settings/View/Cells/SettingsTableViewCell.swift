//
//  SettingsTableViewCell.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 04/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.cellView.layer.cornerRadius = 9
        self.cellView.layer.borderWidth = 1.0
        self.cellView.layer.borderColor = UIColor(named: "Settings")?.cgColor
    }
}
