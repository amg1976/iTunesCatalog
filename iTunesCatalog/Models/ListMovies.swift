//
//  ListMovies.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

struct ListMovies: Codable {
    
    struct MovieFeed: Codable {
        var title: String
    }
    
    var feed: MovieFeed
}
