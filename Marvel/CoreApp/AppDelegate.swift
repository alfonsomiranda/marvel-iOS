//
//  AppDelegate.swift
//  Marvel
//
//  Created by Alfonso Miranda on 26/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appInitializer = AppInitializer()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        if window != nil {
            self.appInitializer.installRootViewController()
        }
        
        return true
    }
}
