//
//  ListMovies.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

/// Declares the base properties of a Feed item
protocol Item: Codable {
    var id: String { get }
    var name: String { get }
    var url: String { get }
}

/// Song model
struct Song: Item {
    let id: String
    let name: String
    let url: String
    let artistName: String
    let collectionName: String
}

/// Movie model
struct Movie: Item {
    let id: String
    let name: String
    let url: String
}

/// Models the root element of the ListResponse object
struct Feed<Item: Codable>: Codable {
    
    /// The title of the feed
    var title: String
    
    /// An array with the actual list items
    var results: [Item]
}

/// Models the response received from fetching a list Resource
struct ListResponse<Item: Codable>: Codable {
    var feed: Feed<Item>
}
