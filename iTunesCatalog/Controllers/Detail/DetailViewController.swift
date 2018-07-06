//
//  ViewController.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 18/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

/// Shows a list of items from a specified FeedType
final class DetailViewController: UIViewController {

    // MARK: - Private properties

    private var feedType: FeedType!
    private lazy var loadingController = LoadingViewController()
    private lazy var errorController = ErrorViewController.create { [unowned self] in
        self.hide(self.errorController)
        self.show(self.loadingController)
    }

    // MARK: - Private init

    override private init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("Not implemented")
    }

    // MARK: - Public methods

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        show(loadingController)
        
        delay(1) {
            self.hide(self.loadingController)
            self.show(self.errorController)
        }
    }

}

extension DetailViewController {
    
    static func create(withFeedType feedType: FeedType) -> DetailViewController {
        
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: self)) as? DetailViewController else {
            fatalError("Unable to create DetailViewController")
        }
        
        viewController.feedType = feedType
        
        return viewController
    }
    
}

private typealias Private = DetailViewController
private extension Private {
    
    func setup() {
        navigationItem.title = feedType.controllerTitle
    }

}
