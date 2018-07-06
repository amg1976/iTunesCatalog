//
//  LocalFilesService.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 06/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

/// Loads Resources from local json files
final class LocalFilesService: ResourceLoader {
    
    private let jsonLoader = JsonFileLoader(withBundle: Bundle.main)
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T>) -> Void) {

        let jsonLoader = JsonFileLoader(withBundle: Bundle.main)

        if resource is Resource<ListResponse<Movie>> {
            
            let jsonString = jsonLoader.movies()
            let moviesResource = ResourceFactory.createListMoviesResource()
            // swiftlint:disable force_cast
            let response = moviesResource.parse(jsonString: jsonString) as! T
            // swiftlint:enable force_cast
            
            completion(.succeeded(response))
            
        } else if resource is Resource<ListResponse<Song>> {

            let jsonString = jsonLoader.songs()
            let songsResource = ResourceFactory.createListSongsResource()
            // swiftlint:disable force_cast
            let response = songsResource.parse(jsonString: jsonString) as! T
            // swiftlint:enable force_cast
            
            completion(.succeeded(response))

        }
        
    }
    
}
