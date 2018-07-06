//
//  FeedDetailViewModel.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 06/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

final class FeedDetailViewModel {
    
    // MARK: - Private methods
    
    private let feedType: FeedType
    private let clientApi: ClientApi
    private let userInterfaceIdiom: UIUserInterfaceIdiom

    // MARK: - Public properties
    
    var controllerTitle: String {
        return feedType.controllerTitle
    }
    
    // MARK: - Public methods
    
    init(withFeedType feedType: FeedType, clientApi: ClientApi, userInterfaceIdiom: UIUserInterfaceIdiom) {
        self.feedType = feedType
        self.clientApi = clientApi
        self.userInterfaceIdiom = userInterfaceIdiom
    }
    
    func loadData(onCompletion completion: @escaping (Result<ItemCollectionViewModel>) -> Void) {
        
        switch feedType {
            
        case .movies:
            clientApi.getMovies { [weak self] (result) in
                
                guard let strongSelf = self else { return }
                
                switch result {
                    
                case .succeeded(let movies):
                    let items: [Item] = movies.feed.results.map({ Item(title: $0.name) })
                    let viewModel = ItemCollectionViewModel(withTitle: movies.feed.title,
                                                            items: items,
                                                            userInterfaceIdiom: strongSelf.userInterfaceIdiom)
                    completion(Result.succeeded(viewModel))
                    
                case .errored(let error):
                    completion(Result.errored(error))
                }
            }
            
        case .songs:
            clientApi.getSongs { [weak self] (result) in

                guard let strongSelf = self else { return }

                switch result {
                    
                case .succeeded(let songs):
                    let items: [Item] = songs.feed.results.map({ Item(title: $0.name) })
                    let viewModel = ItemCollectionViewModel(withTitle: songs.feed.title,
                                                            items: items,
                                                            userInterfaceIdiom: strongSelf.userInterfaceIdiom)
                    completion(Result.succeeded(viewModel))

                case .errored(let error):
                    completion(Result.errored(error))
                }

            }
        }
        
    }
    
}
