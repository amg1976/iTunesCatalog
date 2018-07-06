//
//  MockObjects.swift
//  iTunesCatalogTests
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation
@testable import iTunesCatalog

class SongsResourceLoader: ResourceLoader {
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T>) -> Void) {
        let jsonLoader = JsonFileLoader(withBundle: Bundle(for: ModelTests.self))
        let jsonString = jsonLoader.songs()
        let songsResource = ResourceFactory.createListSongsResource()
        // swiftlint:disable force_cast
        let response = songsResource.parse(jsonString: jsonString) as! T
        // swiftlint:enable force_cast
        
        DispatchQueue.global(qos: .background).async {
            completion(.succeeded(response))
        }
    }
}

class MoviesResourceLoader: ResourceLoader {
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T>) -> Void) {
        let jsonLoader = JsonFileLoader(withBundle: Bundle(for: ModelTests.self))
        let jsonString = jsonLoader.movies()
        let moviesResource = ResourceFactory.createListMoviesResource()
        // swiftlint:disable force_cast
        let response = moviesResource.parse(jsonString: jsonString) as! T
        // swiftlint:enable force_cast
        
        DispatchQueue.global(qos: .background).async {
            completion(.succeeded(response))
        }
    }
}

class ErroredResourceLoader: ResourceLoader {
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            completion(.errored(NetworkError.parseError))
        }
    }
    
}

class NetworkErroredResourceLoader: ResourceLoader {
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            completion(.errored(NSError(domain: "com.amg.itunescatalog.error", code: 100, userInfo: nil)))
        }
    }
    
}
