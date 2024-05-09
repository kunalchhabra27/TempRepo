//
//  AppListViewModel.swift
//  AppleMarketingTools
//
//  Created by Kunal Chhabra on 05/05/24.
//

import Foundation
import UIKit

protocol AppListViewModelProtocol {
    var apps: [App] { get }
    func fetchTopFreeApps(completion: @escaping (Result<AppResponse, NetworkError>) -> Void)
}

class AppListViewModel: AppListViewModelProtocol {
    
    private let useCase: AppListUseCaseProtocol
    var apps: [App] = []
    
    init(useCase: AppListUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func fetchTopFreeApps(completion: @escaping (Result<AppResponse, NetworkError>) -> Void) {
        useCase.fetchTopFreeApps { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let appResponse):
                self.apps = appResponse.feed.results
                completion(.success(appResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
