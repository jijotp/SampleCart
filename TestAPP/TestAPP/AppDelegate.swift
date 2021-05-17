//
//  AppDelegate.swift
//  TestAPP
//
//  Created by Arjun on 29/01/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    static var isPortarit = true

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       // NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        return true
    } 
    @objc func rotated() {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            AppDelegate.isPortarit = false
        }

        if UIDevice.current.orientation.isPortrait {
            print("Portrait")
            AppDelegate.isPortarit = true
        }
    }
}
