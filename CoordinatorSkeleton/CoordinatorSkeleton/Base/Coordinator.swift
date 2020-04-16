//
//  Coordinator.swift
//  CoordinatorSkeleton
//
//  Created by Ilkay Hamit on 16/09/2019.
//  Copyright © 2019 Ilkay Hamit. All rights reserved.
//

import Foundation

protocol CoordinatorProtocol: class {
    func start()
}

class Coordinator: CoordinatorProtocol {
    
    private(set) var childCoordinators: [Coordinator] = []
    
    func start() {
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(of: coordinator) {
            childCoordinators.remove(at: index)
        } else {
            print("Couldn't remove coordinator: \(coordinator). It's not a child coordinator.")
        }
    }
    
    func removeAllChildCoordinatorsWith<T>(type: T.Type) {
        childCoordinators = childCoordinators.filter { $0 is T  == false }
    }
    
    func removeAllChildCoordinators() {
        childCoordinators.removeAll()
    }
    
    func removeLastChildCoordinators() {
        if let lastCoordinator = childCoordinators.last {
            removeChildCoordinator(lastCoordinator)
        }
    }
    
    // Override point, mark non-secure areas
    func isSecureArea() -> Bool {
        return true
    }
}

extension Coordinator: Equatable {
    static func == (lhs: Coordinator, rhs: Coordinator) -> Bool {
        return lhs === rhs
    }
}

