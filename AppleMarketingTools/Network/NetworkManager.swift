//
//  NetworkManager.swift
//  AppleMarketingTools
//
//  Created by Kunal Chhabra on 05/05/24.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

protocol NetworkManagerProtocol {
    func fetchData<T: Codable>(from url: URL, completion: @escaping (Result<T, NetworkError>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    func fetchData<T: Decodable>(from url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        // Create URLSession
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(.invalidURL))
                return
            }
            guard let responseData = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: responseData)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
