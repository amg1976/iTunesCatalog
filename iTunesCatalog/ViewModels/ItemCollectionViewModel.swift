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

final class ItemCollectionViewModel: NSObject {

    // MARK: - Private properties

    private var items: [Item]

    // MARK: - Public properties
    
    let title: String

    // MARK: - Public methods
    
    init(withTitle title: String, items: [Item]) {
        self.title = title
        self.items = items
    }
}

extension ItemCollectionViewModel: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionCell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: String(describing: ItemCollectionHeader.self), for: indexPath)
        if let header = view as? ItemCollectionHeader {
            header.headerLabel.text = self.title
        }
        return view
    }
    
}
