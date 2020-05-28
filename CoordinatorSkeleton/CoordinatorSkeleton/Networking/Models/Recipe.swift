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
    var steps: [String]
    var ingredients: [String]
}


struct Recipes: Codable {
    var recipes: [RecipeAPI]
}

struct RecipeAPI: Codable {
    var userId: Int
    var recipeId: Int
    var name: String
    var ingredients: [String: String]
    var steps: [String]
    var timeToCook: Double
    var difficulty: Int
    var cuisine: String
    var image: String
    var people: String
}
