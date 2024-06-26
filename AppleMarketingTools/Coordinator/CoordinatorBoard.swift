//
//  CoordinatorBoard.swift
//  AppleMarketingTools
//
//  Created by Kunal Chhabra on 08/05/24.
//

import Foundation
import UIKit

protocol CoordinatorBoard : UIViewController {
    static func instantiateFromStoryBoard() -> Self
}

extension CoordinatorBoard {
    static func instantiateFromStoryBoard() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let id = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
