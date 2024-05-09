//
//  ImageDownloader.swift
//  AppleMarketingTools
//
//  Created by Kunal Chhabra on 05/05/24.
//

import Foundation
import UIKit

protocol ImageDownloaderProtocol {
    func downloadImage(fromURL url: URL, completion: @escaping (Result<UIImage, Error>) -> Void)
}

class ImageDownloader<T> {
    private let imageDownloader: ImageDownloaderProtocol
    private let updateHandler: (T, UIImage) -> Void
    
    init(imageDownloader: ImageDownloaderProtocol, updateHandler: @escaping (T, UIImage) -> Void) {
        self.imageDownloader = imageDownloader
        self.updateHandler = updateHandler
    }
    
    func downloadImage(fromURL url: URL, forComponent component: T) {
        imageDownloader.downloadImage(fromURL: url) { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.updateHandler(component, image)
                }
            case .failure(let error):
                print("Failed to download image: \(error)")
            }
        }
    }
}
