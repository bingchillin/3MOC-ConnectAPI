//
//  AppDelegate.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 11/01/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)

        window.rootViewController = UINavigationController(rootViewController: RDVViewController())
        window.makeKeyAndVisible()

        self.window = window

        return true
    }

}

