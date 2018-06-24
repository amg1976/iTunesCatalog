//
//  Api.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 21/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case parseError
}

/// Defines methods needed to load a Resource asynchronously
protocol ResourceLoader {
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T>) -> Void)
}

/// Loads Resources using a shared URLSession
final class NetworkService: ResourceLoader {
    
    /// Implements the protocol method to asynchronously load a resource from the network
    ///
    /// - Parameters:
    ///   - resource: the Resource to be loaded
    ///   - completion: the closure to be executed once the request finishes
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: URLRequest(withResource: resource)) { (data, _, error) in
            
            guard error == nil else {
                completion(.errored(error!))
                return
            }
            
            guard let modelObject = data.flatMap(resource.parse) else {
                completion(.errored(NetworkError.parseError))
                return
            }
            
            completion(.succeeded(modelObject))
        }
        
        task.resume()
        
    }
    
}
