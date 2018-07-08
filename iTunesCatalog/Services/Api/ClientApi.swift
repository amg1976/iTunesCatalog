//
//  ClientApi.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

final class ClientApi {
    
    // MARK: - Public properties
    
    private (set) var resourceLoader: ResourceLoader
    private (set) var imageCache: GenericCache

    // MARK: - Public methods

    /// Creates a new instance of the ClientApi object
    ///
    /// - Parameter resourceLoader: an instance of ResourceLoader. Defaults to NetworkService.
    init(withResourceLoader resourceLoader: ResourceLoader = NetworkService(),
         imageCache: GenericCache = ImageCache()) {
        self.resourceLoader = resourceLoader
        self.imageCache = imageCache
    }
    
    /// Fetchs a list of movies from the resource loader
    ///
    /// - Parameter completion: returns an instance of ListResponse<Movie> or an Error if it fails fetching / parsing.
    func getMovies(onCompletion completion: @escaping (Result<ListResponse<Movie>>) -> Void) {
        
        let moviesResource = ResourceFactory.createListMoviesResource()
        
        getItems(withResource: moviesResource, completion: completion)
        
    }

    /// Fetchs a list of songs from the resource loader
    ///
    /// - Parameter completion: returns an instance of ListResponse<Song> or an Error if it fails fetching / parsing.
    func getSongs(onCompletion completion: @escaping (Result<ListResponse<Song>>) -> Void) {
        
        let songsResource = ResourceFactory.createListSongsResource()

        getItems(withResource: songsResource, completion: completion)
        
    }
    
}

private typealias Private = ClientApi
private extension Private {

    func getItems<T>(withResource resource: Resource<T>, completion: @escaping (Result<T>) -> Void) {
        
        resourceLoader.load(resource: resource) { result in
            
            DispatchQueue.main.async {
                completion(result)
            }
            
        }
        
    }
    
}
