//
//  ResourceFactory+Extensions.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 07/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

extension ResourceFactory {
  
    /// Creates a Resource to fetch and parse UIImages based on the provided url string
    ///
    /// - Parameter url: String pointing to the desired image
    /// - Returns: a Resource<UIImage> object
    class func createImageResource(withUrl url: String) -> Resource<UIImage>? {
        
        guard let imageUrl = URL(string: url) else {
            return nil
        }
        
        return Resource(httpMethod: .get, url: imageUrl, parse: { data in
            return UIImage(data: data)
        })
        
    }

}
