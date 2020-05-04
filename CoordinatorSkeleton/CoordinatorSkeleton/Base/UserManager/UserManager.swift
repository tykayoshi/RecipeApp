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
        self.currentUser = User(name: userName!
            , age: "27", dietaryRequirements:["Vegetarian"], essentialList: ["Oat Milk"])
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
    
    var dietaryReq: [String]? {
        get {
            return userDefaults.stringArray(forKey: "dietaryReq")
        }
        set (newValue) {
            userDefaults.set(newValue, forKey: "dietaryReq")
        }
    }
    
    var essentialList: [String]? {
        get {
            return userDefaults.stringArray(forKey: "essentialList")
        }
        set (newValue) {
            userDefaults.set(newValue, forKey: "essentialList")
        }
    }
    
}

// Test User Defaults
// UserManager.shared.foodPref = "VEG"
// let foodPref = UserManager.shared.foodPref
// print(foodPref)
