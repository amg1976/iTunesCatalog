//
//  ListCoordinator.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

protocol ListCoordinatorDelegate: class {
    func didSelect(controller: UIViewController)
}

/// Coordinator for the List flow
final class ListCoordinator: FlowCoordinator {

    // MARK: - Private properties
    
    private var clientApi: ClientApi
    private var innerNavigationController: UINavigationController?

    // MARK: - Public properties
    
    let rootController =  UINavigationController(nibName: nil, bundle: nil)
    private (set) weak var delegate: ListCoordinatorDelegate?

    // MARK: - Public methods

    init(withDelegate delegate: ListCoordinatorDelegate, clientApi: ClientApi) {
        self.delegate = delegate
        self.clientApi = clientApi
    }
    
    func start() {
        let listViewController = FeedListViewController.create(withDelegate: self)
        rootController.viewControllers = [listViewController]
    }
    
    func showDetail(_ detailViewController: UIViewController) {
        rootController.pushViewController(detailViewController, animated: true)
    }
    
}

extension ListCoordinator: ListViewControllerDelegate {
    
    func didSelectFeed(type: FeedType) {
        
        let viewModel = FeedDetailViewModel(withFeedType: type,
                                            clientApi: clientApi,
                                            isIpad: (UIDevice.current.userInterfaceIdiom == .pad),
                                            delegate: self)
        
        let detailViewController = FeedDetailViewController(withViewModel: viewModel)

        let detailNavigationController = UINavigationController(rootViewController: detailViewController)
        
        delegate?.didSelect(controller: detailNavigationController)
        
        self.innerNavigationController = detailNavigationController
    }
    
}

extension ListCoordinator: FeedDetailViewModelDelegate {
    
    func didSelectFeedItem(_ item: ItemDetailViewModel) {
        let controller = ItemDetailViewController.create(withViewModel: item)
        innerNavigationController?.pushViewController(controller, animated: true)
    }

}
