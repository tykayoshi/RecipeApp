//
//  GetProfileRequest.swift
//  RecipeApp
//
//  Created by Rhiannaa on 23/06/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

class GetProfileRequest: APIRequest {
    
    typealias RequestDataType = Router
    typealias RequestObject = String
    typealias ResponseDataType = User
    
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
    
    func parseResponse(data: Data, response: URLResponse?) throws -> User {
        let decoder = JSONDecoder()
        let data = try decoder.decode(User.self, from: data)
        return data
    }
}
