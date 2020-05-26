//
//  Router.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 20/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

/*
 
 scheme = "https://"
 
 host = "google.com"
 
 path = "/admin/blah/blah"
 
 parameters = "page=1&this=12345"
 */

enum Router {
    case getRecipes
    
    var scheme: String {
        switch self {
        case .getRecipes:
           return "http"
        }
    }
    
    var host: String {
        switch self {
        case .getRecipes:
           return "3.10.226.73"
        }
    }
        
    var port: Int? {
        switch self {
        case .getRecipes:
            return 8081
        }
    }
    
    var path: String {
        switch self {
        case .getRecipes:
            return "/api/recipes"
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .getRecipes:
            return nil
        }
    }
    
    var method: String {
        switch self {
        case .getRecipes:
            return "GET"
        }
    }
}
