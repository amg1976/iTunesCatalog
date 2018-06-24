//
//  ResourceFactory.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

/// Declares class methods that create instances of Resource
class ResourceFactory {

    /// Creates a Resource that declares how to access the ListMovies endpoint
    ///
    /// - Returns: a Resource<ListResponse> object
    class func createListMoviesResource() -> Resource<ListResponse<Movie>> {
        return Resource(withUrl: "https://rss.itunes.apple.com/api/v1/ie/movies/top-movies/all/50/explicit.json", httpMethod: .get)
    }

    /// Creates a Resource that declares how to access the ListSongs endpoint
    ///
    /// - Returns: a Resource<ListResponse> object
    class func createListSongsResource() -> Resource<ListResponse<Song>> {
        return Resource(withUrl: "https://rss.itunes.apple.com/api/v1/ie/itunes-music/hot-tracks/all/50/explicit.json", httpMethod: .get)
    }

}
