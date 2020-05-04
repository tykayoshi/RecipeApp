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
    case option1
    case option2
    case option3
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
        
        options = [.option1, .option2, .option3]
        
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
    let cellSet = tableView.dequeueReusableCell(withIdentifier: String(describing: SettingsTableViewCell.self), for: indexPath) as! SettingsTableViewCell
    
//    switch sections[indexPath.section] {
//    case let .setting(rows: options):
//        let rowTitle = options[indexPath.row]
//        switch rowTitle {
//        case .option1:
//            cellSet.textLabel?.text = "Option1"
//        case .option2:
//            cellSet.textLabel?.text = "Option2"
//        case .option3:
//            cellSet.textLabel?.text = "Option3"
//        }
//    }
    
        return cellSet
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

