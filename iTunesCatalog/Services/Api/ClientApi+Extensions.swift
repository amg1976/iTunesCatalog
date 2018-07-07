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
    ///   - url: String pointing to the desired image
    ///   - completion: returns an instance of a UIImage
    func getImage(withUrl url: String, completion: @escaping (Result<UIImage>) -> Void) {
        
        guard let imageResource = ResourceFactory.createImageResource(withUrl: url) else {
            completion(Result.errored(ClientApiError.invalidUrl))
            return
        }
        
        resourceLoader.load(resource: imageResource) { result in
            
            DispatchQueue.main.async {
                completion(result)
            }
            
        }
        
    }
    
}
