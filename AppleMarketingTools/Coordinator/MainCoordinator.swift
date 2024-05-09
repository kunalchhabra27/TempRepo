//
//  MainCoordinator.swift
//  AppleMarketingTools
//
//  Created by Kunal Chhabra on 08/05/24.
//

import Foundation
import UIKit

class MainCoordinator : ParentCoordinator {
    
    var navigationController: UINavigationController
    var childCoordinator: [ChildCoordinator] = [ChildCoordinator]()
    
    init(with _navigationController : UINavigationController){
        self.navigationController = _navigationController
    }
    
    func configureRootViewController() {
        let appListChildCoordinator = ChildCoordinatorFactory.create(with: self.navigationController, type: .appListHome)
        childCoordinator.append(appListChildCoordinator)
        appListChildCoordinator.parentCoordinator = self
        appListChildCoordinator.configureChildViewController()
    }
    
    func removeChildCoordinator(child: ChildCoordinator) {
        for(index, coordinator) in childCoordinator.enumerated() {
            if(coordinator === child) {
                childCoordinator.remove(at: index)
                break
            }
        }
    }
}
