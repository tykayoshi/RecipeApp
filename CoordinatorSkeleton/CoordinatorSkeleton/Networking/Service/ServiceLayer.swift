//
//  ServiceLayer.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 20/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

class ServiceLayer {
    
    class func request<T: Codable>(router: Router, completion: @escaping (Result<T, Error>) -> ()) {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.port = router.port
        components.path = router.path
        components.queryItems = router.parameters

        
        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                completion(.failure(error!))
                print(error?.localizedDescription)
                return
            }
            
            guard response != nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            let responseObject = try! JSONDecoder().decode(T.self, from: data)
            
            DispatchQueue.main.async {
                completion(.success(responseObject))
            }
        }
        
        dataTask.resume()
    }
}
