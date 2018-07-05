//
//  ListCoordinator.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

protocol ListCoordinatorDelegate: class {
    func didSelectFeed(type: FeedType)
}

final class ListCoordinator: FlowCoordinator {

    let rootController =  UINavigationController(nibName: nil, bundle: nil)
    
    private (set) weak var delegate: ListCoordinatorDelegate?
    
    init(withDelegate delegate: ListCoordinatorDelegate) {
        self.delegate = delegate
    }
    
    func start() {
        let listViewController = ListViewController.create(withDelegate: self)
        rootController.viewControllers = [listViewController]
    }
    
    func showDetail(_ detailViewController: UIViewController) {
        rootController.pushViewController(detailViewController, animated: true)
    }
    
}

extension ListCoordinator: ListViewControllerDelegate {
    
    func didSelectFeed(type: FeedType) {
        delegate?.didSelectFeed(type: type)
    }
    
}