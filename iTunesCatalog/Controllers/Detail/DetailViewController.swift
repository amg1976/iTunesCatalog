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

    private var viewModel: DetailViewModel!
    private lazy var loadingController = LoadingViewController()
    private lazy var errorController = ErrorViewController.create { [unowned self] in
        self.load()
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
        load()
    }

}

extension DetailViewController {
    
    static func create(withViewModel viewModel: DetailViewModel) -> DetailViewController {
        
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: self)) as? DetailViewController else {
            fatalError("Unable to create DetailViewController")
        }
        
        viewController.viewModel = viewModel
        
        return viewController
    }
    
}

private typealias Private = DetailViewController
private extension Private {
    
    func setup() {
        navigationItem.title = viewModel.controllerTitle
    }
    
    func load() {

        hide(errorController)
        show(loadingController)

        viewModel.loadData { [weak self] (result) in
            
            guard let strongSelf = self else { return }
            
            switch result {
                
            case .succeeded(let items):
                print(items.count)
                
            case .errored(let error):
                strongSelf.errorController.error = error
                strongSelf.hide(strongSelf.loadingController)
                strongSelf.show(strongSelf.errorController)
            }

        }

    }

}
