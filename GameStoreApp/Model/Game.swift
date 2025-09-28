//
//  Game.swift
//  GameStoreApp
//
//  Created by Ravan Asgarov on 19.09.25.
//

import Foundation

enum Category: String, CaseIterable, Codable {
    case all //= "All Games"
    case popular //= "Popular"
    case trending // = "Trending"
    case newLaunch //= "New Launch"
    case free // = "Free"
    case indie // = "Indie"
    
    var displayName: String {
            switch self {
            case .all: "All Games"
            case .popular: "Popular"
            case .trending: "Trending"
            case .newLaunch: "New Launch"
            case .free: "Free"
            case .indie: "Indie"
            }
        }
}

struct Game: Codable {
    let title: String
    let category: [Category]
    let price: String
    let imageName: String
    let about: String
}
