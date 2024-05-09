//
//  AppListViewController+UI.swift
//  AppleMarketingTools
//
//  Created by Kunal Chhabra on 05/05/24.
//

import UIKit

extension AppListViewController {
    func setupUI() {
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {
        self.view.addSubview(appListTV)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([appListTV.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0.0),
                                     appListTV.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0),
                                     appListTV.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0),
                                     appListTV.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0.0)])
    }
}
