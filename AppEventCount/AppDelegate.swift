//
//  AppDelegate.swift
//  AppEventCount
//
//  Created by Ryo Togashi on 2019-08-26.
//  Copyright © 2019 Ryo Togashi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var viewController: ViewController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        viewController = window?.rootViewController as? ViewController
        let defaults = UserDefaults.standard
        viewController?.launchCount = defaults.integer(forKey: "launchCount")
        viewController?.willTerminateCount = defaults.integer(forKey: "willTerminate")
        viewController?.launchCount += 1
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        viewController?.resignActiveCount += 1
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        viewController?.didEnterBackgroundCount += 1
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        viewController?.willEnterForegroundCount += 1
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        viewController?.didBecomeActiveCount += 1
        viewController?.updateUI()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        viewController?.willTerminateCount += 1
        let defaults = UserDefaults.standard
        defaults.set(viewController?.willTerminateCount, forKey: "willTerminate")
    }


}

