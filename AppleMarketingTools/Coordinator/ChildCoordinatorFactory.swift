//
//  ChildCoordinatorFactory.swift
//  AppleMarketingTools
//
//  Created by Kunal Chhabra on 08/05/24.
//

import Foundation
import UIKit

enum childCoordinatorType {
    case appListHome
    case appListDetail
}

class ChildCoordinatorFactory {
    static func create(with _navigationController: UINavigationController, type: childCoordinatorType) -> ChildCoordinator {
        
        switch type {
        case .appListHome:
            return AppListChildCoordinator(with: _navigationController)
        case .appListDetail:
            return AppListDetailChildCoordinator(with: _navigationController)
        }
    }
}
