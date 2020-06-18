//
//  Recipe.swift
//  RecipeApp
//
//  Created by Natalie Adeyinka on 06/05/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

// Home Page
struct Recipe: Codable {
    var name: String
    var timeToCook: String
    var difficulty: String
    var image: String
    var people: Int
    var steps: [String]
    var ingredients: [String]
}

struct RecipeAPI: Codable {
    var userId: Int
    var recipeId: String
    var name: String
    var ingredients: [String: String]
    var steps: [String]
    var timeToCook: Int
    var difficulty: String
    var cuisine: String
    var image: String
    var people: Int
}
