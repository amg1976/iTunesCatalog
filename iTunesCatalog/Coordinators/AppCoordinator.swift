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

        let rootController: UIViewController

        if UIDevice.current.userInterfaceIdiom == .pad {
            let emptyViewController = EmptyViewController.create()
            let splitViewController = UISplitViewController(nibName: nil, bundle: nil)
            splitViewController.preferredDisplayMode = .allVisible
            splitViewController.viewControllers = [listCoordinator.navigationController, emptyViewController]
            rootController = splitViewController
            self.splitViewController = splitViewController
        } else {
            rootController = listCoordinator.navigationController
        }
        
        window.rootViewController = rootController
        window.makeKeyAndVisible()
    }
    
}

extension AppCoordinator: ListCoordinatorDelegate {

    func didSelectFeed() {

        let detailViewController = DetailViewController.create(withDate: Date())

        if UIDevice.current.userInterfaceIdiom == .pad {
            splitViewController?.showDetailViewController(detailViewController, sender: nil)
        } else {
            listCoordinator.showDetail(detailViewController)
        }

    }

}
