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
        //self.currentUser = User(name: "name"
            //, age: "27", dietaryRequirements:["Vegetarian"], shoppingEssentials:["Oat Milk"])
    }
    
    var hasCompletedSignup: Bool? {
        get {
            return userDefaults.bool(forKey: "hasCompletedSignup")
        }
        set (newValue) {
            userDefaults.set(newValue, forKey: "hasCompletedSignup")
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
