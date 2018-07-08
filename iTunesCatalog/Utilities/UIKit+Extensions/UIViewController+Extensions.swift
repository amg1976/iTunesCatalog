//
//  UIViewController+Extensions.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 06/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

extension UIViewController {
 
    func show(_ childViewController: UIViewController) {
        
        childViewController.willMove(toParentViewController: self)
        
        self.addChildViewController(childViewController)
        
        childViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(childViewController.view)
        childViewController.view.pin(toView: self.view)
        
        childViewController.didMove(toParentViewController: self)
        
    }
    
    func hide(_ childViewController: UIViewController) {
        childViewController.willMove(toParentViewController: nil)
        childViewController.removeFromParentViewController()
        childViewController.view.removeFromSuperview()
        childViewController.didMove(toParentViewController: nil)
    }

}
