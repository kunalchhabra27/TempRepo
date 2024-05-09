//
//  AppListViewController+UITableView.swift
//  AppleMarketingTools
//
//  Created by Kunal Chhabra on 05/05/24.
//

import UIKit

extension AppListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func registerCell() {
        appListTV.register(AppListTableViewCell.self, forCellReuseIdentifier: AppListTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.apps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppListTableViewCell.identifier, for: indexPath) as! AppListTableViewCell
        let app = apps[indexPath.row]
        cell.configure(with: app)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowTapped = indexPath.row
        let detailData = apps[rowTapped]
        appListChildCoordinator?.navigateToAppListDetailVC(data: detailData)
    }
    
}
