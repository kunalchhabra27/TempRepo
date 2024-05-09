//
//  AppResponse.swift
//  AppleMarketingTools
//
//  Created by Kunal Chhabra on 05/05/24.
//

import Foundation

struct AppResponse: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let results: [App]
}

struct App: Codable {
    let name: String
    let artistName: String
    let releaseDate: String
    let artworkUrl100: String
}
