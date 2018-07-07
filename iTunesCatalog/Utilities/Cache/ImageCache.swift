//
//  ImageCache.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 08/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

class ImageCache: GenericCache {

    func set(_ item: UIImage, withKey key: String) {

        guard let imageData = UIImagePNGRepresentation(item),
            let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return }
        
        let fileUrl = cacheDirectory.appendingPathComponent("\(key).png", isDirectory: false)

        try? imageData.write(to: fileUrl)
        
    }
    
    func get(withKey key: String) -> UIImage? {

        guard let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        
        let fileUrl = cacheDirectory.appendingPathComponent("\(key).png", isDirectory: false)
            
        guard let imageData = try? Data(contentsOf: fileUrl), let image = UIImage(data: imageData) else { return nil }

        return image

    }

}
