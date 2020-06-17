//
//  StepsTableViewCell.swift
//  RecipeApp
//
//  Created by Rhiannaa on 17/06/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import UIKit

protocol StepsCellProtocol: class {
    func removeStep (step: String)
}

class StepsTableViewCell: UITableViewCell {
    
    weak var delegate: StepsCellProtocol?
    @IBOutlet weak var stepLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func removeStep(_ sender: Any) {
        guard let step = stepLabel.text  else {return}
        delegate?.removeStep(step: step)
    }
    
}
