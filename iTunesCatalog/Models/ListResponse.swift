//
//  ListMovies.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

/// Models the root element of the ListResponse object
struct Feed: Codable {
    
    /// Models an item from the `results` property
    struct Item: Codable {
        var name: String
    }
    
    /// The title of the feed
    var title: String
    
    /// An array with the actual list items
    var results: [Item]
}

/// Models the response received from fetching a list Resource
struct ListResponse: Codable {
    var feed: Feed
}
