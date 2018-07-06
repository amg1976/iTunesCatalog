//
//  ItemDetailViewController.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 06/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

/// Shows the detailed information from a Feed item
final class ItemDetailViewController: UIViewController {

    // MARK: - Private properties
    
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemTitleLabel: UILabel!
    @IBOutlet private weak var itemSubtitleLabel: UILabel!
    
    private var item: Item! {
        didSet {
            guard let item = item else { return }
            loadViewIfNeeded()
            itemTitleLabel.text = item.title
        }
    }
    
}

extension ItemDetailViewController {
    
    static func create(withItem item: Item) -> ItemDetailViewController {
        
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: self)) as? ItemDetailViewController else {
            fatalError("Unable to create ItemDetailViewController")
        }
        
        viewController.item = item
        
        return viewController

    }
}
