//
//  ImageCache.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 08/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

final class ImageCache: GenericCache {

    func set<CacheItem>(_ item: CacheItem, withKey key: String) {

        guard let image = item as? UIImage,
            let imageData = UIImagePNGRepresentation(image),
            let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return }
        
        let fileUrl = cacheDirectory.appendingPathComponent("\(key).png", isDirectory: false)

        try? imageData.write(to: fileUrl)
        
    }
    
    func get<CacheItem>(withKey key: String) -> CacheItem? {

        guard let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        
        let fileUrl = cacheDirectory.appendingPathComponent("\(key).png", isDirectory: false)
        
        guard let imageData = try? Data(contentsOf: fileUrl), let image = UIImage(data: imageData) else { return nil }

        return image as? CacheItem

    }

}
