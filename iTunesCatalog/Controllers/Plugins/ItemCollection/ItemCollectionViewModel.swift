//
//  ItemCollectionViewModel.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 06/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

protocol ItemCollectionViewModelDelegate: AnyObject {
    func didSelect(item: ItemDetailViewModel)
}

/// ViewModel for the ItemCollectionViewController
final class ItemCollectionViewModel: NSObject {

    // MARK: - Private properties

    private var items: [ItemDetailViewModel]
    private var isIpad: Bool

    // MARK: - Public properties
    
    private (set) weak var delegate: ItemCollectionViewModelDelegate?
    var itemCount: Int { return items.count }
    let title: String
    var itemSize: (width: Float, height: Float) {
        return isIpad ? (200, 200) : (100, 100)
    }

    // MARK: - Public methods
    
    init(withTitle title: String,
         items: [ItemDetailViewModel],
         isIpad: Bool,
         delegate: ItemCollectionViewModelDelegate) {
        self.title = title
        self.items = items
        self.isIpad = isIpad
        self.delegate = delegate
    }
    
    func itemAt(indexPath: IndexPath) -> ItemDetailViewModel? {
        guard (0..<itemCount).contains(indexPath.item) else { return nil }
        return items[indexPath.item]
    }
}
