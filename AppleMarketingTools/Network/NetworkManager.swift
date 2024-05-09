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
//        // Define the URL
//        let urlString = "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc"
//        guard let url = URL(string: urlString) else {
//            print("Error: Invalid URL")
//            return
//        }
//        
//        // Define the request
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyY2ZlYzE1YjA2YjUwMjQ0YzM5NDEyN2U4NWU3OWEwOCIsInN1YiI6IjY2M2JjMDI1NWFjOGE4YWIxZWVjYmJmYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Eo5Pbzn722oKOan5lV55nUyD9suhH6stgnuvRlKbJGg", forHTTPHeaderField: "Authorization")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")

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
