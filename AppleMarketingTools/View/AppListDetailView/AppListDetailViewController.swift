//
//  AppListDetailViewController.swift
//  AppleMarketingTools
//
//  Created by Kunal Chhabra on 06/05/24.
//

import UIKit

class AppListDetailViewController: UIViewController, CoordinatorBoard {
    
    weak var appListDetailChildCoordinator: AppListDetailChildCoordinator?
    var tempNewData: App?
    
    lazy var artistNameLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var releaseDataLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureData()
    }
    
    func configureData() {
        artistNameLbl.text = tempNewData?.artistName ?? "hello"
        releaseDataLbl.text = tempNewData?.releaseDate ?? "world"
    }
}
