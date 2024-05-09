//
//  AppListTableViewCell+UI.swift
//  AppleMarketingTools
//
//  Created by Kunal Chhabra on 05/05/24.
//

import UIKit

extension AppListTableViewCell {
    
    func setupUI() {
        self.selectionStyle = .none
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {
        self.contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(appNameLbl)
        cellBackgroundView.addSubview(artistImage)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([cellBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0.0),
                                     cellBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0.0),
                                     cellBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0.0),
                                     cellBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0.0),
                                    
                                     appNameLbl.topAnchor.constraint(equalTo: cellBackgroundView.topAnchor, constant: 0.0),
                                     appNameLbl.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 0.0),
                                     appNameLbl.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor, constant: 0.0),
                                    
                                     artistImage.topAnchor.constraint(equalTo: appNameLbl.bottomAnchor, constant: 0.0),
                                     artistImage.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 0.0),
                                     artistImage.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor, constant: 0.0),
                                     artistImage.bottomAnchor.constraint(equalTo: cellBackgroundView.bottomAnchor, constant: 0.0)
                                    ])
    }
}
