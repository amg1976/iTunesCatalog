//
//  ListMovies.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

/// Declares the base properties of a Feed item
protocol FeedItem: Codable {
    var id: String { get }
    var name: String { get }
    var url: String { get }
}

/// Models the root element of the ListResponse object
struct Feed<Item: FeedItem>: Codable {
    
    /// The title of the feed
    var title: String
    
    /// An array with the actual list items
    var results: [Item]
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        if let results = try? values.decode([Item].self, forKey: .results) {
            self.results = results
        } else {
            self.results = []
        }
    }
}

/// Models the response received from fetching a list Resource
struct ListResponse<Item: FeedItem>: Codable {
    var feed: Feed<Item>
}
