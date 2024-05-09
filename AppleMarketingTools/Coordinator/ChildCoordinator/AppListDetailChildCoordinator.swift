//
//  AppListDetailChildCoordinator.swift
//  AppleMarketingTools
//
//  Created by Kunal Chhabra on 08/05/24.
//

import Foundation
import UIKit

class AppListDetailChildCoordinator: ChildCoordinator {
    
    weak var parentCoordinator: ParentCoordinator?
    var navigationController: UINavigationController
    private var tempData: App?
    
    init(with _navigationController: UINavigationController){
        self.navigationController = _navigationController
    }
    
    func configureChildViewController() {
        let appListDetailVC = AppListDetailViewController.instantiateFromStoryBoard()
        appListDetailVC.tempNewData = self.tempData
        self.navigationController.pushViewController(appListDetailVC, animated: true)
    }
    
    func passParameter(detailData: App) {
        self.tempData = detailData
    }
}
