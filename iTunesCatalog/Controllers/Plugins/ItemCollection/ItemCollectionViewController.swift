//
//  ItemCollectionViewController.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 06/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

/// Cell used for displaying Feed items on a collection view
final class ItemCollectionCell: UICollectionViewCell {
    
    static var reusableIdentifier: String {
        return String(describing: ItemCollectionCell.self)
    }
    
    private (set) var item: ItemDetailViewModel?
    
    func configure(withItem item: ItemDetailViewModel) {
        self.item = item
        self.backgroundColor = .red
    }
    
}

/// Shows a collection of Feed items
final class ItemCollectionViewController: UIViewController {
    
    // MARK: - Private properties
    
    @IBOutlet private weak var collectionView: UICollectionView!
    private var viewModel: ItemCollectionViewModel! {
        didSet {
            collectionView.dataSource = viewModel
            collectionView.delegate = viewModel
            (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.estimatedItemSize = CGSize(width: CGFloat(viewModel.itemSize.width), height: CGFloat(viewModel.itemSize.height))
        }
    }

    // MARK: - Private init
    
    override private init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - Public methods
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}

extension ItemCollectionViewController {
    
    static func create(withViewModel viewModel: ItemCollectionViewModel) -> ItemCollectionViewController {
        
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: self)) as? ItemCollectionViewController else {
            fatalError("Unable to create ItemCollectionViewController")
        }
        
        viewController.loadViewIfNeeded()
        viewController.viewModel = viewModel
        
        return viewController
    }
    
}

private typealias Private = ItemCollectionViewController
private extension Private {
    
    func setup() {
        collectionView.register(ItemCollectionCell.self, forCellWithReuseIdentifier: ItemCollectionCell.reusableIdentifier)
    }
    
}
