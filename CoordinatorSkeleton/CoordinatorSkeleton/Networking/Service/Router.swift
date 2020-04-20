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
    case getSources
    case getProductIds
    
    var scheme: String {
        switch self {
        case .getSources, .getProductIds:
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .getSources, .getProductIds:
            return "shopicruit.myshopify.com"
        }
    }
    
    var path: String {
        switch self {
        case .getSources:
            return "/admin/custom_collections.json"
        case .getProductIds:
            return "/admin/collects.json"
        }
    }
    
    var parameters: [URLQueryItem] {
        let accessToken = "c32313df0d0ef512ca64d5b336a0d7c6"
        switch self {
        case .getSources:
            return [URLQueryItem(name: "page", value: "1"),
                    URLQueryItem(name: "access_token", value: accessToken)]
            
        case .getProductIds:
            return [URLQueryItem(name: "page", value: "1"),
                    URLQueryItem(name: "collection_id", value: "68424466488"),
                    URLQueryItem(name: "access_token", value: accessToken)]
        }
    }
    
    var method: String {
        switch self {
        case .getSources, .getProductIds:
            return "GET"
        }
    }
}


