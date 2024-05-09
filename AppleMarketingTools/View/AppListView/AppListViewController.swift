//
//  AppListViewController.swift
//  AppleMarketingTools
//
//  Created by Kunal Chhabra on 05/05/24.
//

import UIKit

class AppListViewController: UIViewController, CoordinatorBoard {
    
    lazy var appListTV: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    lazy var viewModel: AppListViewModel = {
        return AppListViewModel(useCase: AppListUseCase(repository: AppRepository(networkManager: NetworkManager())))
    }()
    
    weak var appListChildCoordinator : AppListChildCoordinator?
    var apps: [App] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCell()
        fetchApps()
    }
    
    private func fetchApps() {
            viewModel.fetchTopFreeApps { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success:
                    DispatchQueue.main.async { [weak self] in
                        guard let self else { return }
                        self.apps = viewModel.apps 
                        self.appListTV.reloadData()
                    }
                case .failure(let error):
                    print("Failed to fetch apps: \(error)")
                }
            }
        }
}
