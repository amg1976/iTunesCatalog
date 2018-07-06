//
//  FeedDetailViewModel.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 06/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

protocol FeedDetailViewModelDelegate: AnyObject {
    func didSelectFeedItem(_ item: ItemDetailViewModel)
}

/// ViewModel that loads and processes the API data to show a collection of Feed items
final class FeedDetailViewModel {
    
    // MARK: - Private methods
    
    private let feedType: FeedType
    private let clientApi: ClientApi
    private let isIpad: Bool
    private weak var delegate: FeedDetailViewModelDelegate?

    // MARK: - Public properties
    
    var controllerTitle: String {
        return feedType.controllerTitle
    }
    
    // MARK: - Public methods
    
    init(withFeedType feedType: FeedType,
         clientApi: ClientApi,
         isIpad: Bool,
         delegate: FeedDetailViewModelDelegate) {
        
        self.feedType = feedType
        self.clientApi = clientApi
        self.isIpad = isIpad
        self.delegate = delegate
    }
    
    func loadData(onCompletion completion: @escaping (Result<ItemCollectionViewModel>) -> Void) {
        
        switch feedType {
            
        case .movies:
            clientApi.getMovies { [weak self] (result) in
                
                guard let strongSelf = self else { return }
                
                switch result {
                    
                case .succeeded(let movies):
                    let items: [ItemDetailViewModel] = movies.feed.results.map { ItemDetailViewModel(title: $0.name, subtitle: $0.artistName, imageUrl: $0.artworkUrl100) }
                    let viewModel = ItemCollectionViewModel(withTitle: movies.feed.title,
                                                            items: items,
                                                            isIpad: strongSelf.isIpad,
                                                            delegate: strongSelf)
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
                    let items: [ItemDetailViewModel] = songs.feed.results.map { ItemDetailViewModel(title: $0.name, subtitle: $0.artistName, imageUrl: $0.artworkUrl100) }
                    let viewModel = ItemCollectionViewModel(withTitle: songs.feed.title,
                                                            items: items,
                                                            isIpad: strongSelf.isIpad,
                                                            delegate: strongSelf)
                    completion(Result.succeeded(viewModel))

                case .errored(let error):
                    completion(Result.errored(error))
                }

            }
        }
        
    }
    
}

extension FeedDetailViewModel: ItemCollectionViewModelDelegate {
    
    func didSelect(item: ItemDetailViewModel) {
        delegate?.didSelectFeedItem(item)
    }
}
