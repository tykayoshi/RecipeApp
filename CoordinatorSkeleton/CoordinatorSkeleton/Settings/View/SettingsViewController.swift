//
//  SettingsViewController.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 22/04/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

enum SettingSections {
    case setting(rows: [SettingOption])
}

enum SettingOption {
    case about2
    case terms2
}

class SettingsViewController: UIViewController {
    
    var presenter: SettingsPresenterProtocol!
    var sections: [SettingSections] = []
    var options: [SettingOption] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let settingsNib = UINib(nibName: String(describing: SettingsTableViewCell.self), bundle: nil)
        tableView?.register(settingsNib, forCellReuseIdentifier: String(describing: SettingsTableViewCell.self))
        
        options = [.about2, .terms2]
        
        sections = [.setting(rows: options)]
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
}



extension SettingsViewController: SettingsViewProtocol {
    
}


extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case let .setting(amount):
            return amount.count
        }
    }

    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SettingsTableViewCell.self), for: indexPath) as! SettingsTableViewCell
        
        cell.selectionStyle = .none
        
        switch sections[indexPath.section] {
        case let .setting(rows: options):
            let rowTitle = options[indexPath.row]
            switch rowTitle {
            case .about2:
                cell.settingsImg.image = UIImage(named: "about2")
                cell.settingsTitle.text = "About"
            case .terms2:
                cell.settingsImg.image = UIImage(named: "terms2")
                cell.settingsTitle.text = "Terms and Conditions"
            }
        }
            return cell
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}



// Created using Swiftgen in terminal
extension SettingsViewController {
    static func makeFromStoryboard() -> SettingsViewController {
        let viewController = StoryboardScene.Settings.settingsViewController.instantiate()
        return viewController
    }
}

