//
//  GetRecipeRequest.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 18/06/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

class GetRecipeRequest: APIRequest {
    
    typealias RequestDataType = Router
    typealias RequestObject = String
    typealias ResponseDataType = [RecipeAPI]
    
    func makeRequest(from router: Router, requestObject: RequestObject) throws -> URLRequest {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.port = router.port
        components.path = router.path
        components.queryItems = router.parameters

        guard let url = components.url else {
            fatalError()
        }
        
        var urlRequest = URLRequest(url: url, timeoutInterval: 1)
        urlRequest.httpMethod = router.method
        
        return urlRequest

    }
    
    func parseResponse(data: Data, response: URLResponse?) throws -> [RecipeAPI] {
        let decoder = JSONDecoder()
        let data = try decoder.decode([RecipeAPI].self, from: data)
        return data
    }
}
