//
//  UserManager.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 21/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

class UserManager {
    
    static let shared = UserManager()
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    var foodPref: String? {
        get {
            return userDefaults.string(forKey: "foodPref")
        }
        set (newValue) {
            userDefaults.set(newValue, forKey: "foodPref")
        }
    }
}

// Test User Defaults
// UserManager.shared.foodPref = "VEG"
// let foodPref = UserManager.shared.foodPref
// print(foodPref)
