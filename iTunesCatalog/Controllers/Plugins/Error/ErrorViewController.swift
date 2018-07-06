//
//  ErrorViewController.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 06/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

/// Shows an error message and a retry button
final class ErrorViewController: UIViewController {

    // MARK: - Private properties
    
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var retryButton: UIButton! {
        didSet {
            retryButton?.addTarget(self, action: #selector(tappedRetryButton(_:)), for: .touchUpInside)
        }
    }
    
    private var retryHandler: (() -> Void)?

    // MARK: - Private init

    override private init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("Not implemented")
    }

    // MARK: - Public properties
    
    var error: Error? {
        didSet {
            guard let error = error else { return }
            errorLabel.text = error.localizedDescription
        }
    }
    
    // MARK: - Public methods

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}

extension ErrorViewController {
    
    static func create(withRetryHandler handler: @escaping () -> Void) -> ErrorViewController {

        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: self)) as? ErrorViewController else {
            fatalError("Unable to create ErrorViewController")
        }

        viewController.retryHandler = handler
        
        return viewController
    }
    
}

private typealias Private = ErrorViewController
private extension Private {
    
    func setup() {
        errorLabel.text = "Some error occurred"
        retryButton.setTitle("Retry", for: .normal)
    }
    
    @objc
    func tappedRetryButton(_ sender: UIButton) {
        retryHandler?()
    }

}
