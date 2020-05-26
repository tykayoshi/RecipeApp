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


/**
 import Foundation

 // http://52.56.76.83:8081/api/recipes

 /*
  
  scheme = "https://"
  
  host = "google.com"
  
  path = "/admin/blah/blah"
  
  parameters = "page=1&this=12345"
  */

 enum Router {
     case getSources
     case getProductIds
     case getRecipies
     
     var scheme: String {
         switch self {
         case .getSources, .getProductIds:
             return "https"
         case .getRecipies:
             return "http"
         }
     }
     
     var host: String {
         switch self {
         case .getSources, .getProductIds:
             return "shopicruit.myshopify.com"
         case .getRecipies:
             return "52.56.76.83"
         }
     }
     
     var port: Int? {
         switch self {
         case .getSources, .getProductIds:
             return nil
         case .getRecipies:
             return 8081
         }
     }
     
     var path: String {
         switch self {
         case .getSources:
             return "/admin/custom_collections.json"
         case .getProductIds:
             return "/admin/collects.json"
         case .getRecipies:
             return "/api/recipes"
         }
     }
     
     var parameters: [URLQueryItem]? {
         let accessToken = "c32313df0d0ef512ca64d5b336a0d7c6"
         switch self {
         case .getSources:
             return [URLQueryItem(name: "page", value: "1"),
                     URLQueryItem(name: "access_token", value: accessToken)]
             
         case .getProductIds:
             return [URLQueryItem(name: "page", value: "1"),
                     URLQueryItem(name: "collection_id", value: "68424466488"),
                     URLQueryItem(name: "access_token", value: accessToken)]
         case .getRecipies:
             return nil
         }
     }
     
     var method: String {
         switch self {
         case .getSources, .getProductIds, .getRecipies:
             return "GET"
         }
     }
 }
 */


