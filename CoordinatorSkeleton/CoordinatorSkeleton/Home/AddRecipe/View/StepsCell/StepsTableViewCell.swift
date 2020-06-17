//
//  StepsTableViewCell.swift
//  RecipeApp
//
//  Created by Rhiannaa on 17/06/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import UIKit
protocol StepCellProtocol: class {
    func removeStep(step: String)
}
class StepsTableViewCell: UITableViewCell {
 
    @IBOutlet weak var stepLabel: UILabel!
    weak var delegate: StepCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func removeStepButtonPressed(_ sender: Any) {
        guard let step = stepLabel.text else {
            return
        }
        delegate?.removeStep(step: step)
    }
    
    
}
