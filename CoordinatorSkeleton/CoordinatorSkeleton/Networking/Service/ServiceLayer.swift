//
//  ServiceLayer.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 20/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

public enum APIError: Error {
    case unhandledError(message: String)
}

protocol APIRequest {
    associatedtype RequestRouter
    associatedtype RequestObject
    associatedtype ResponseDataType
    
    func makeRequest(from router: RequestRouter, requestObject: RequestObject) throws -> URLRequest
    func parseResponse(data: Data, response: URLResponse?) throws -> ResponseDataType
}

class ServiceLayer {
    
    class func request<T: APIRequest>(apiRequest: T, router: T.RequestRouter, requestObject: T.RequestObject, completion: @escaping (Result<T.ResponseDataType, APIError>) -> ()) {
        
        var urlRequest = try! apiRequest.makeRequest(from: router, requestObject: requestObject)

        let session = URLSession(configuration: .default)
        
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                completion(.failure(.unhandledError(message: "yep")))
                print(error?.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            switch response.statusCode {
            case 200...299:
                do {
                    let parseResponse = try apiRequest.parseResponse(data: data, response: response)
                    // let responseObject = try JSONDecoder().decode(T.self, from: data)
                     DispatchQueue.main.async {
                        completion(.success(parseResponse))
                    }
                } catch {
                    completion(.failure(.unhandledError(message: "yep")))
                    }
            default:
                completion(.failure(.unhandledError(message: "yep")))
                }
        }
        
        dataTask.resume()
    }
}
