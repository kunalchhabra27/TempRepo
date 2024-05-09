//
//  Coordinator.swift
//  AppleMarketingTools
//
//  Created by Kunal Chhabra on 08/05/24.
//

import Foundation
import UIKit

protocol Coordinator : AnyObject {
    var navigationController: UINavigationController { get set }
}

protocol ParentCoordinator : Coordinator {
    var childCoordinator: [ChildCoordinator] { get set }
    func configureRootViewController()
    func removeChildCoordinator(child: ChildCoordinator)
}

protocol ChildCoordinator : Coordinator {
    var parentCoordinator : ParentCoordinator? { get set }
    func configureChildViewController()
    func passParameter(detailData: App)
}

extension ChildCoordinator {
    func passParameter(detailData: App) {}
}
