//
//  ProfileInteractor.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 23/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

class ProfileInteractor: ProfileInteractorProtocol {
    func getProfile(completion: @escaping (Result<User, Error>) -> Void) {
        ServiceLayer.request(router: Router.getProfile) { (result: Result<User, Error>) in
                switch result {
                case .success:
                    completion(result)
                case .failure:
                    completion(result)
                }
        }

    }
}
