//
//  Recipe.swift
//  RecipeApp
//
//  Created by Natalie Adeyinka on 06/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

struct Recipe: Codable {
    var name: String
    var timeToCook: String
    var difficulty: String
    var image: String
    var people: Int
}
