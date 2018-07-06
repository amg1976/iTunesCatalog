//
//  ListViewController.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

protocol ListViewControllerDelegate: class {
    func didSelectFeed(type: FeedType)
}

/// Shows a list of feed types
final class ListViewController: UITableViewController {
    
    // MARK: - Public properties
    
    private (set) weak var delegate: ListViewControllerDelegate?
    
    // MARK: - Private init
    
    override private init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - Public methods

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let feedType = FeedType(rawValue: indexPath.row) else { return }
        delegate?.didSelectFeed(type: feedType)
    }
    
}

extension ListViewController {

    static func create(withDelegate delegate: ListViewControllerDelegate) -> ListViewController {
        
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: self)) as? ListViewController else {
            fatalError("Unable to create ListViewController")
        }
        
        viewController.delegate = delegate
        
        return viewController
    }

}
