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

    private var feedType: FeedType!
    
    override private init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
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
