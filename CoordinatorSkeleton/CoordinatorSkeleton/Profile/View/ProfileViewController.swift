//
//  ProfileViewController.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 23/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit


enum ProfileSections {
    case profile(rows: [ProfileOptions])
}

enum ProfileOptions {
    case name
    case age
    case dietaryRequirements
    case essentialList
}

class ProfileViewController: UIViewController {
    
    var presenter: ProfilePresenterProtocol!
    var currentUser: User?
    var sections: [ProfileSections] = []
    var options: [ProfileOptions] = []
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.makeRounded()
        
        options = [.name, .age, .dietaryRequirements, .essentialList]
        
        sections = [.profile(rows: options)]
        
        presenter.passCurrentUser()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
}

extension ProfileViewController: ProfileViewProtocol {
    func getCurrentUser(user: User) {
        currentUser = user
    }
    
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case let .profile(amount):
            return amount.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        
        switch sections[indexPath.section] {
        case let .profile(rows: options):
            let rowTitle = options[indexPath.row]
            switch rowTitle {
            case .name:
                cell.textLabel?.text = "Name"
                cell.detailTextLabel?.text = currentUser?.name
            case .age:
                cell.textLabel?.text = "Age"
                cell.detailTextLabel?.text = currentUser?.age
            case .dietaryRequirements:
                cell.textLabel?.text = "Dietary Requirements"
                cell.detailTextLabel?.text = currentUser?.dietaryRequirements[0]
            case .essentialList:
                cell.textLabel?.text = "Essential List"
                cell.detailTextLabel?.text = currentUser?.essentialList[0]
            }
        }
        
        return cell
    }
    
    
}



// Created using Swiftgen in terminal
extension ProfileViewController {
    static func makeFromStoryboard() -> ProfileViewController {
        let viewController = StoryboardScene.Profile.profileViewController.instantiate()
        return viewController
    }
}


