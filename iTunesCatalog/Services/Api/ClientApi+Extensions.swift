//
//  ClientApi+Extensions.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 07/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

enum ClientApiError: Error {
    case invalidUrl
}

extension ClientApi {
    
    /// Fetchs an image from the resource loader
    ///
    /// - Parameters:
    ///   - imageId: String with a unique identifier for the image
    ///   - url: String pointing to the desired image
    ///   - completion: returns an instance of a UIImage
    func getImage(withId imageId: String, url: String, completion: @escaping (Result<UIImage>) -> Void) {
        
        if let image: UIImage = imageCache.get(withKey: imageId) {
            completion(Result.succeeded(image))
            return
        }
        
        guard let imageResource = ResourceFactory.createImageResource(withUrl: url) else {
            completion(Result.errored(ClientApiError.invalidUrl))
            return
        }
        
        resourceLoader.load(resource: imageResource) { [weak self] result in
            
            if case let Result.succeeded(image) = result {
                self?.imageCache.set(image, withKey: imageId)
            }
            
            DispatchQueue.main.async {
                completion(result)
            }
            
        }
        
    }
    
}
