//
//  FeedDetailViewController.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 18/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

/// Shows a list of items from a specified FeedType
final class FeedDetailViewController: UIViewController {

    // MARK: - Private properties

    private var viewModel: FeedDetailViewModel!
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
        fatalError("Not implemented")
    }
    
    init(withViewModel viewModel: FeedDetailViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        load()
    }

}

private typealias Private = FeedDetailViewController
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
