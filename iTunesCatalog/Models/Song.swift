//
//  Song.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

/// Song model
struct Song: FeedItem {
    let id: String
    let name: String
    let url: String
    let artistName: String
    let collectionName: String
}
