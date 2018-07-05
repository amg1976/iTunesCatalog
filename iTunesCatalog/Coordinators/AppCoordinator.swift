//
//  AppCoordinator.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

protocol FlowCoordinator {
    func start()
}

final class AppCoordinator: FlowCoordinator {
    
    private var window: UIWindow
    private var listCoordinator: ListCoordinator!
    private var splitViewController: UISplitViewController?
    
    init(withWindow window: UIWindow) {
        self.window = window
        defer {
            self.listCoordinator = ListCoordinator(withDelegate: self)
        }
    }
    
    func start() {

        listCoordinator.start()

        let emptyViewController = EmptyViewController.create()

        let splitViewController = UISplitViewController(nibName: nil, bundle: nil)
        splitViewController.viewControllers = [listCoordinator.rootController, emptyViewController]
        splitViewController.delegate = self
        splitViewController.preferredDisplayMode = .allVisible
        self.splitViewController = splitViewController
        
        window.rootViewController = splitViewController
        window.makeKeyAndVisible()
    }
    
}

extension AppCoordinator: UISplitViewControllerDelegate {
    
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    
    func splitViewController(_ splitViewController: UISplitViewController,
                             showDetail vc: UIViewController,
                             sender: Any?) -> Bool {
        
        if splitViewController.isCollapsed {
            listCoordinator.showDetail(vc)
            return true
        }
        
        return false
        
    }
    
}

extension AppCoordinator: ListCoordinatorDelegate {
    
    func didSelectFeed(type: FeedType) {
        let detailViewController = DetailViewController.create(withFeedType: type)
        splitViewController?.showDetailViewController(detailViewController, sender: nil)
    }
    
}
