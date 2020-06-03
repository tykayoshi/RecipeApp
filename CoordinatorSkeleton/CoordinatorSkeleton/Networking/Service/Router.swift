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
    
    var scheme: String {
        switch self {
        case .getRecipes:
           return "http"
        case .getProfile:
            return "http"
        }
    }
    
    var host: String {
        switch self {
        case .getRecipes:
           return "3.8.209.207"
        case .getProfile:
           return "3.8.209.207"
        }
    }
        
    var port: Int? {
        switch self {
        case .getRecipes:
            return 8081
        case .getProfile:
            return 8082
        }
    }
    
    var path: String {
        switch self {
        case .getRecipes:
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
        case .getRecipes:
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
        }
    }
}
