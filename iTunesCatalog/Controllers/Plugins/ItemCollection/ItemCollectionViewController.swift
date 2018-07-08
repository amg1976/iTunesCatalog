//
//  ItemCollectionViewController.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 06/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

/// Shows a collection of Feed items
final class ItemCollectionViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let collectionView: UICollectionView = {
        let result = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = .white
        return result
    }()
    
    private var viewModel: ItemCollectionViewModel!

    // MARK: - Private init
    
    override private init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("Not implemented")
    }
    
    // MARK: - Public methods
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    init(withViewModel viewModel: ItemCollectionViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        setup()
    }

}

private typealias Private = ItemCollectionViewController
private extension Private {
    
    func setup() {

        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.pin(toView: view)

        collectionView.register(ItemCollectionCell.self, forCellWithReuseIdentifier: ItemCollectionCell.reusableIdentifier)
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize = CGSize(width: CGFloat(viewModel.itemSize.width), height: CGFloat(viewModel.itemSize.height))
    }
    
}
