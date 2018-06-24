//
//  ResourceFactory.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

class ResourceFactory {

    class func createListMoviesResource() -> Resource<ListMovies> {
        return Resource(withUrl: "https://rss.itunes.apple.com/api/v1/ie/movies/top-movies/all/50/explicit.json", httpMethod: .get)
    }

}
