//
//  UIImageView+Extensions.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 07/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

extension UIImageView {

    private static let activityIndicatorTag: Int = 100
    
    func startActivityIndicator() {
        
        var activityIndicator = self.subviews.filter({ $0.tag == UIImageView.activityIndicatorTag }).first as? UIActivityIndicatorView
        
        if activityIndicator == nil {
            activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
            activityIndicator?.tag = UIImageView.activityIndicatorTag
            activityIndicator?.translatesAutoresizingMaskIntoConstraints = false
            activityIndicator?.hidesWhenStopped = true
            addSubview(activityIndicator!)

            activityIndicator?.center(inView: self)
        }
        
        self.image = nil
        backgroundColor = .lightGray
        activityIndicator?.startAnimating()
        
    }

    func stopActivityIndicator(withResult result: Result<UIImage>) {
        
        let activityIndicator = self.subviews.filter({ $0.tag == UIImageView.activityIndicatorTag }).first as? UIActivityIndicatorView
        activityIndicator?.stopAnimating()
        
        switch result {
        case .succeeded(let image):
            backgroundColor = .white
            self.image = image
        case .errored:
            backgroundColor = .red
            image = nil
        }

    }
    
}
