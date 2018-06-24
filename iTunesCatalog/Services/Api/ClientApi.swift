//
//  ClientApi.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

final class ClientApi {
    
    private var resourceLoader: ResourceLoader
    
    /// Creates a new instance of the ClientApi object
    ///
    /// - Parameter resourceLoader: an instance of ResourceLoader. Defaults to NetworkService.
    init(withResourceLoader resourceLoader: ResourceLoader = NetworkService()) {
        self.resourceLoader = resourceLoader
    }
    
    /// Fetchs a list of movies from the resource loader
    ///
    /// - Parameter completion: an instance of ListResponse<Movie> or nil if it fails fetching / parsing.
    func getMovies(onCompletion completion: @escaping (Result<ListResponse<Movie>>) -> Void) {
        
        let moviesResource = ResourceFactory.createListMoviesResource()
        
        resourceLoader.load(resource: moviesResource) { result in
            completion(result)
        }
        
    }
    
}
