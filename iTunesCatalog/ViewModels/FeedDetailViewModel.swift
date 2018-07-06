//
//  FeedDetailViewModel.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 06/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

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
    
    func loadData(onCompletion completion: @escaping (Result<ItemCollectionViewModel>) -> Void) {
        
        switch feedType {
            
        case .movies:
            clientApi.getMovies { (result) in
                
                switch result {
                    
                case .succeeded(let movies):
                    let items: [Item] = movies.feed.results.map({ Item(title: $0.name) })
                    let viewModel = ItemCollectionViewModel(withTitle: movies.feed.title, items: items)
                    completion(Result.succeeded(viewModel))
                    
                case .errored(let error):
                    completion(Result.errored(error))
                }
            }
            
        case .songs:
            clientApi.getSongs { (result) in

                switch result {
                    
                case .succeeded(let songs):
                    let items: [Item] = songs.feed.results.map({ Item(title: $0.name) })
                    let viewModel = ItemCollectionViewModel(withTitle: songs.feed.title, items: items)
                    completion(Result.succeeded(viewModel))

                case .errored(let error):
                    completion(Result.errored(error))
                }

            }
        }
        
    }
    
}
