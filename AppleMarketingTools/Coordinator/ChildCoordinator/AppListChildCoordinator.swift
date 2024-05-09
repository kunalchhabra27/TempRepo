//
//  AppListChildCoordinator.swift
//  AppleMarketingTools
//
//  Created by Kunal Chhabra on 08/05/24.
//

import Foundation
import UIKit

class AppListChildCoordinator : ChildCoordinator {

    weak var parentCoordinator: ParentCoordinator?
    var navigationController: UINavigationController

    init(with _navigationController: UINavigationController){
        self.navigationController = _navigationController
    }

    func configureChildViewController() {
        let appListVC = AppListViewController.instantiateFromStoryBoard()
        appListVC.appListChildCoordinator = self
        self.navigationController.pushViewController(appListVC, animated: false)
    }

    func navigateToAppListDetailVC(data: App) {
        let appListDetailChildCoordinator = ChildCoordinatorFactory.create(with: navigationController, type: .appListDetail)
        appListDetailChildCoordinator.passParameter(detailData: data)
        
        parentCoordinator?.childCoordinator.append(appListDetailChildCoordinator)
        ///MARK: Commenting the below statement because navigation wasn't working
//        parentCoordinator?.removeChildCoordinator(child: self)
        appListDetailChildCoordinator.configureChildViewController()
    }
}
