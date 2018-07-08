//
//  LoadingViewController.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 05/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

/// Shows an activity indicator, tipically used when waiting for an async API request
final class LoadingViewController: UIViewController {

    // MARK: - Private properties

    private let activityView: UIActivityIndicatorView = {
        let result = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.hidesWhenStopped = false
        return result
    }()
        
    // MARK: - Private init

    override private init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("Not implemented")
    }
    
    // MARK: - Public methods

    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func willMove(toParentViewController parent: UIViewController?) {
        super.willMove(toParentViewController: parent)
        
        if parent == nil {
            activityView.stopAnimating()
        } else {
            activityView.startAnimating()
        }
    }

}

private typealias Private = LoadingViewController
private extension Private {
    
    func setup() {
        self.view.addSubview(activityView)
        activityView.center(inView: view)
    }
    
}
