//
//  TabBarController+Extension.swift
//  CoordinatorSkeleton
//
//  Created by Ilkay Hamit on 16/09/2019.
//  Copyright © 2019 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

extension UITabBarController {
    func add(viewController: UIViewController) {
        var vcs: [UIViewController] = self.viewControllers ?? [UIViewController]()
        vcs.append(viewController)
        self.setViewControllers(vcs, animated: false)
    }
}
