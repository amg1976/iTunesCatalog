//
//  Result.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

/// Encapsulates a response that can either succeeds with a associated value, or fails with an associated error
enum Result<Value> {
    case succeeded(Value)
    case errored(Error)
}
