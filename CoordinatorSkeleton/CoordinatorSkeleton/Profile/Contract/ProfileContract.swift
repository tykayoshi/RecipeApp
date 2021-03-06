//
//  ProfileContract.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 23/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

protocol ProfileCoordinatorProtocol: class {
    
}

protocol ProfilePresenterProtocol: class {
    //func passCurrentUser()
    func getProfileFromAPI()
}

protocol ProfileViewProtocol: class {
    func getCurrentUser(user: User)
    func getProfile(result: User) 
}
protocol ProfileInteractorProtocol: class {
    func getProfile(completion: @escaping (Result<User, APIError>) -> Void)
}
