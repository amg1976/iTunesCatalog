//
//  UIView+Extensions.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 08/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

extension UIView {
    
    func pin(toView view: UIView) {
    
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.topAnchor),
            self.rightAnchor.constraint(equalTo: view.rightAnchor),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.leftAnchor.constraint(equalTo: view.leftAnchor)
            ])
    }
    
    func center(inView view: UIView) {

        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])

    }
    
}
