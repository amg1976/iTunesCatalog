//
//  FeedType.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 05/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

/// Type of feeds the app will show
enum FeedType: Int {
    case movies = 0
    case songs
}

extension FeedType {
    
    var controllerTitle: String {
        switch self {
        case .movies: return "Movies"
        case .songs: return "Songs"
        }
    }
    
}
