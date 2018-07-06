//
//  ItemCollectionViewModel+Extensions.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 06/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

extension ItemCollectionViewModel: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionCell.reusableIdentifier, for: indexPath)
        
        if let item = itemAt(indexPath: indexPath),
            let cell = cell as? ItemCollectionCell {
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
