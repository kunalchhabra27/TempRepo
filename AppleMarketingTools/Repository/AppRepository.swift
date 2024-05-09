//
//  AppRepository.swift
//  AppleMarketingTools
//
//  Created by Kunal Chhabra on 05/05/24.
//

import Foundation

protocol RepositoryProtocol {
    func fetchTopFreeApps(completion: @escaping (Result<AppResponse, NetworkError>) -> Void)
}

class AppRepository: RepositoryProtocol {
    private let networkManager: NetworkManagerProtocol
    private let baseURL = URL(string: "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json")!

    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

    func fetchTopFreeApps(completion: @escaping (Result<AppResponse, NetworkError>) -> Void) {
        networkManager.fetchData(from: baseURL, completion: completion)
    }
}
