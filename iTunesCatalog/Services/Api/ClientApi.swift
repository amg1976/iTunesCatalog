//
//  ClientApi.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

class ClientApi {
    
    private var networkService: ResourceLoader
    
    init(withNetworkService networkService: ResourceLoader) {
        self.networkService = networkService
    }
    
    func getVideos(completion: @escaping (ListResponse?) -> Void) {
        
        let moviesResource = ResourceFactory.createListMoviesResource()
        
        networkService.load(resource: moviesResource) { result in
            completion(result)
        }
    }
    
}
