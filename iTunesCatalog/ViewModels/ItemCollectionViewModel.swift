//
//  ItemCollectionViewModel.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 06/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

struct Item {
    let title: String
}

protocol ItemCollectionViewModelDelegate: AnyObject {
    func didSelect(item: Item)
}

/// ViewModel for the ItemCollectionViewController
final class ItemCollectionViewModel: NSObject {

    // MARK: - Private properties

    private var items: [Item]
    private var userInterfaceIdiom: UIUserInterfaceIdiom
    private weak var delegate: ItemCollectionViewModelDelegate?

    // MARK: - Public properties
    
    let title: String
    var itemSize: CGSize {
        switch userInterfaceIdiom {
        case .phone:
            return CGSize(width: 100, height: 100)
        case .pad:
            return CGSize(width: 200, height: 200)
        case .tv, .carPlay, .unspecified:
            return .zero
        }
    }

    // MARK: - Public methods
    
    init(withTitle title: String,
         items: [Item],
         userInterfaceIdiom: UIUserInterfaceIdiom,
         delegate: ItemCollectionViewModelDelegate) {
        self.title = title
        self.items = items
        self.userInterfaceIdiom = userInterfaceIdiom
        self.delegate = delegate
    }
}

extension ItemCollectionViewModel: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = items[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionCell.reusableIdentifier, for: indexPath)
        
        if let cell = cell as? ItemCollectionCell {
            cell.configure(withItem: item)
        }
        
        return cell
    }
    
}

extension ItemCollectionViewModel: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? ItemCollectionCell,
            let item = cell.item {
            delegate?.didSelect(item: item)
        }
        
    }
    
}
