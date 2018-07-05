//
//  AppDelegate.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 18/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    private var appCoordinator: AppCoordinator!
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.appCoordinator = AppCoordinator(withWindow: window!)
        appCoordinator.start()
        return true
    }

}
