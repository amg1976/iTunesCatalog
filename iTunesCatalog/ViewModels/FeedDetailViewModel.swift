//
//  FeedDetailViewModel.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 06/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

struct DetailItem {
    let title: String
}

final class FeedDetailViewModel {
    
    // MARK: - Private methods
    
    private let feedType: FeedType
    private let clientApi: ClientApi

    // MARK: - Public properties
    
    var controllerTitle: String {
        return feedType.controllerTitle
    }
    
    // MARK: - Public methods
    
    init(withFeedType feedType: FeedType, clientApi: ClientApi) {
        self.feedType = feedType
        self.clientApi = clientApi
    }
    
    func loadData(onCompletion completion: @escaping (Result<[DetailItem]>) -> Void) {
        
        switch feedType {
            
        case .movies:
            clientApi.getMovies { (result) in
                
                switch result {
                    
                case .succeeded(let movies):
                    print(movies.feed.title)
                    completion(Result.succeeded([]))
                    
                case .errored(let error):
                    completion(Result.errored(error))
                }
            }
            
        case .songs:
            clientApi.getSongs { (result) in

                switch result {
                    
                case .succeeded(let songs):
                    print(songs.feed.title)
                    completion(Result.succeeded([]))
                    
                case .errored(let error):
                    completion(Result.errored(error))
                }

            }
        }
        
    }
    
}
