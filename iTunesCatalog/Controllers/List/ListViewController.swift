//
//  ListViewController.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

protocol ListViewControllerDelegate: class {
    func didSelectFeed()
}

final class ListViewController: UIViewController {

    private (set) weak var delegate: ListViewControllerDelegate?
    
    override private init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction private func tappedButton(_ sender: Any) {
        delegate?.didSelectFeed()
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
