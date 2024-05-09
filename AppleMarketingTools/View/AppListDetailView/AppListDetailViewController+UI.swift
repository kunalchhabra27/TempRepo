//
//  AppListDetailViewController+UI.swift
//  AppleMarketingTools
//
//  Created by Kunal Chhabra on 06/05/24.
//

import UIKit

extension AppListDetailViewController {
    func setupUI() {
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {
        self.view.addSubview(artistNameLbl)
        self.view.addSubview(releaseDataLbl)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([artistNameLbl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150.0),
                                     artistNameLbl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0),
                                     artistNameLbl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0),
                                     artistNameLbl.heightAnchor.constraint(equalToConstant: 20.0),
                                     
                                     releaseDataLbl.topAnchor.constraint(equalTo: artistNameLbl.bottomAnchor, constant: 10.0),
                                     releaseDataLbl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0),
                                     releaseDataLbl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0),
                                     releaseDataLbl.heightAnchor.constraint(equalToConstant: 18.0)
                                    ])
    }
}
