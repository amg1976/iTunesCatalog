//
//  ItemCollectionViewController.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 06/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

final class ItemCollectionHeader: UICollectionReusableView {
    
    @IBOutlet weak var headerLabel: UILabel!
    
}

/// Shows a collection of Feed items
final class ItemCollectionViewController: UIViewController {
    
    // MARK: - Private properties
    
    @IBOutlet private weak var collectionView: UICollectionView!
    private var viewModel: ItemCollectionViewModel! {
        didSet {
            loadViewIfNeeded()
            collectionView.dataSource = viewModel
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
        
        viewController.viewModel = viewModel
        
        return viewController
    }
    
}

private typealias Private = ItemCollectionViewController
private extension Private {
    
    func setup() {
        collectionView.register(ItemCollectionHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: String(describing: ItemCollectionHeader.self))
    }
    
}
