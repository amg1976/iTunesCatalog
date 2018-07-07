//
//  ImageCache.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 08/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

protocol GenericCache {
    associatedtype CacheItem
    func set(_ item: CacheItem, withKey key: String)
    func get(withKey key: String) -> CacheItem?
}
