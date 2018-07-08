//
//  ImageCache.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 08/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

protocol GenericCache {
    func set<CacheItem>(_ item: CacheItem, withKey key: String)
    func get<CacheItem>(withKey key: String) -> CacheItem?
}
