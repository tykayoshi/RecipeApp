//
//  RAButton.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 27/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import UIKit

class RAButton: UIButton {
    
    // Inspect this property in storyboard
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
     //MARK: Shadow
        @IBInspectable var shadowRadius: CGFloat {
            get {
                return layer.shadowRadius
            }
            set {
    
                layer.shadowRadius = shadowRadius
            }
        }
        @IBInspectable var shadowOffset : CGSize{
            get{
                return layer.shadowOffset
            }set{
                layer.shadowOffset = newValue
            }
        }
    
        @IBInspectable var shadowColor : UIColor{
            get{
                return UIColor.init(cgColor: layer.shadowColor!)
            }
            set {
                layer.shadowColor = newValue.cgColor
            }
        }
        @IBInspectable var shadowOpacity : Float {
            get{
                return layer.shadowOpacity
            }
            set {
                layer.shadowOpacity = newValue
            }
        }
}
