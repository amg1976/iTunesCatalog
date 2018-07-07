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
    
    private var viewModel: ItemDetailViewModel! {
        didSet {
            guard let viewModel = viewModel else { return }
            loadViewIfNeeded()
            itemTitleLabel.text = viewModel.title
            itemSubtitleLabel.text = viewModel.subtitle
            
            itemImageView.startActivityIndicator()
            viewModel.getImage { [weak self] result in
                self?.itemImageView.stopActivityIndicator(withResult: result)
            }
        }
    }
    
}

extension ItemDetailViewController {
    
    static func create(withViewModel viewModel: ItemDetailViewModel) -> ItemDetailViewController {
        
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: self)) as? ItemDetailViewController else {
            fatalError("Unable to create ItemDetailViewController")
        }
        
        viewController.viewModel = viewModel
        
        return viewController

    }
}
