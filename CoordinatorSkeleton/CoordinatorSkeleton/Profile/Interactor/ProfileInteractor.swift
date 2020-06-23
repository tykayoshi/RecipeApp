//
//  ProfileInteractor.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 23/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

class ProfileInteractor: ProfileInteractorProtocol {
    func getProfile(completion: @escaping (Result<User, APIError>) -> Void) {
        ServiceLayer.request(apiRequest: GetProfileRequest(), router: .getProfile, requestObject: "") { (result: Result<User, APIError>) in
            completion(result)
        }

    }
}
