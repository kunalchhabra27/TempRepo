//
//  AppListUseCase.swift
//  AppleMarketingTools
//
//  Created by Kunal Chhabra on 05/05/24.
//

import Foundation

protocol AppListUseCaseProtocol {
    func fetchTopFreeApps(completion: @escaping (Result<AppResponse, NetworkError>) -> Void)
}

class AppListUseCase: AppListUseCaseProtocol {
    private let repository: RepositoryProtocol

    init(repository: RepositoryProtocol) {
        self.repository = repository
    }

    func fetchTopFreeApps(completion: @escaping (Result<AppResponse, NetworkError>) -> Void) {
        repository.fetchTopFreeApps(completion: completion)
    }
}
