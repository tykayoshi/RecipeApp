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
    
    var currentUser: User?
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
        self.currentUser = User(name: "User Name From API", age: "27", dietaryRequirements:["Vegetarian"], essentialList: ["Oat Milk"])
    }
    
    var foodPref: String? {
        get {
            return userDefaults.string(forKey: "foodPref")
        }
        set (newValue) {
            userDefaults.set(newValue, forKey: "foodPref")
        }
    }
    
    var userName: String? {
        get {
            return userDefaults.string(forKey: "userName")
        }
        set (newValue) {
            userDefaults.set(newValue, forKey: "userName")
        }
    }
    
    var userAge: String? {
        get {
            return userDefaults.string(forKey: "userAge")
        }
        set (newValue) {
            userDefaults.set(newValue, forKey: "userAge")
        }
    }
    
}

// Test User Defaults
// UserManager.shared.foodPref = "VEG"
// let foodPref = UserManager.shared.foodPref
// print(foodPref)
