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
    private var userInterfaceIdiom: UIUserInterfaceIdiom

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
    
    init(withTitle title: String, items: [Item], userInterfaceIdiom: UIUserInterfaceIdiom) {
        self.title = title
        self.items = items
        self.userInterfaceIdiom = userInterfaceIdiom
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
    
}
