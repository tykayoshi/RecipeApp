//
//  User.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 23/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

struct User: Codable {
    var name: String
    var age: Int
    var dietaryRequirements: [String]
    var shoppingEssentials: [String]
}
