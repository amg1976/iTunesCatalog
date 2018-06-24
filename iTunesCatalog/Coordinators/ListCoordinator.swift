//
//  ListCoordinator.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

protocol ListCoordinatorDelegate: class {
    func didSelectFeed()
}

final class ListCoordinator: FlowCoordinator {

    let navigationController =  UINavigationController(nibName: nil, bundle: nil)
    
    private (set) weak var delegate: ListCoordinatorDelegate?
    
    init(withDelegate delegate: ListCoordinatorDelegate) {
        self.delegate = delegate
    }
    
    func start() {
        let listViewController = ListViewController.create(withDelegate: self)
        navigationController.viewControllers = [listViewController]
    }
    
    func showDetail(_ detailViewController: UIViewController) {
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
}

extension ListCoordinator: ListViewControllerDelegate {
    
    func didSelectFeed() {
        delegate?.didSelectFeed()
    }
    
}
