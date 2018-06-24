//
//  ViewController.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 18/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {

    @IBOutlet private var dateLabel: UILabel!
    
    override private init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

extension DetailViewController {
    
    static func create(withDate date: Date) -> DetailViewController {
        
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: self)) as? DetailViewController else {
            fatalError("Unable to create DetailViewController")
        }
        
        viewController.loadViewIfNeeded()
        viewController.dateLabel.text = String(describing: date)
        
        return viewController
    }
    
}
