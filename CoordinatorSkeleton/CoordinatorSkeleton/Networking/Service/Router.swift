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
 
 port = 8081
 
 parameters = "page=1&this=12345"
 */

enum Router {
    case getRecipes
    case getProfile
    case postRecipes
    
    var scheme: String {
        switch self {
        case .getRecipes, .getProfile, .postRecipes:
            return "http"
        }
    }
    
    var host: String {
        switch self {
        case .getRecipes, .getProfile, .postRecipes:
            return "35.176.29.6"
        }
    }
        
    var port: Int? {
        switch self {
        case .getRecipes, .postRecipes:
            return 8081
        case .getProfile:
            return 8082
        }
    }
    
    var path: String {
        switch self {
        case .getRecipes, .postRecipes:
            return "/api/recipes"
        case .getProfile:
            return "/api/profiles/1"
        }
    }
    
//    var profileNum: Int?{
//        switch self {
//        case .getRecipes:
//            return nil
//        case .getProfile:
//            return 1
//        }
//    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .getRecipes, .postRecipes:
            return nil
        case .getProfile:
            return nil
        }
    }
    
    var method: String {
        switch self {
        case .getRecipes:
            return "GET"
        case .getProfile:
            return "GET"
        case .postRecipes:
            return "POST"
        }
    }
}
