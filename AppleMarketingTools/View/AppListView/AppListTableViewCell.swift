//
//  AppListTableViewCell.swift
//  AppleMarketingTools
//
//  Created by Kunal Chhabra on 05/05/24.
//

import UIKit

class AppListTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    lazy var cellBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var appNameLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var artistImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "placeHolder")
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    func configure(with app: App) {
        appNameLbl.text = app.name
        if let imageUrl = URL(string: app.artworkUrl100) {
            downloadAndDisplayImage(from: imageUrl)
        }
        else
        {
            self.artistImage.image = UIImage(named: "placeHolder")
        }
    }
    
    private func downloadAndDisplayImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { 
                self.artistImage.image = UIImage(named: "placeHolder")
                return }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.artistImage.image = UIImage(data: data)
            }
        }.resume()
    }
}

