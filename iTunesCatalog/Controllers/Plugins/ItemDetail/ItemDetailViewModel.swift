//
//  ItemDetailViewModel.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 06/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

/// ViewModel to feed each Item in the Feed items collection
struct ItemDetailViewModel {
    let title: String
    let subtitle: String
    let imageUrl: String
    let clientApi: ClientApi
    
    init(withClientApi clientApi: ClientApi, feedItem: FeedItem) {
        self.clientApi = clientApi
        self.title = feedItem.name
        self.subtitle = feedItem.artistName
        self.imageUrl = feedItem.artworkUrl100
    }
    
}
