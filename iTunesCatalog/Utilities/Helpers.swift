//
//  Helpers.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 06/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

func delay(_ time: Double, queue: DispatchQueue = DispatchQueue.main, action: @escaping (() -> Void)) {
    queue.asyncAfter(deadline: DispatchTime.now() + Double(Int64(time * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: action)
}
