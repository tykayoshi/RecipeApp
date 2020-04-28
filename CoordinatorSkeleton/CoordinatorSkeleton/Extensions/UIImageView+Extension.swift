//
//  UIImageView+Extension.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 28/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {

    func makeRounded() {
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}

