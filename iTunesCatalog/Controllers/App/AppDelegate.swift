//
//  AppDelegate.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 18/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        ClientApi().getMovies { movies in
            print(movies)
        }
        
        return true
    }

}
