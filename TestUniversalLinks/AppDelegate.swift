//
//  AppDelegate.swift
//  TestUniversalLinks
//
//  Created by matsuda on 2018/02/19.
//  Copyright © 2018年 matsuda. All rights reserved.
//

import UIKit

extension UIApplicationLaunchOptionsKey {
    static let userActivity = UIApplicationLaunchOptionsKey(rawValue: "UIApplicationLaunchOptionsUserActivityKey")
    static let userActivityIdentifier = UIApplicationLaunchOptionsKey(rawValue: "UIApplicationLaunchOptionsUserActivityIdentifierKey")
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        prepareLogFile()
        log(#function)
        if let options = launchOptions {
            log(String(format: "%@", options))
            /**
             {
                UIApplicationLaunchOptionsSourceApplicationKey = "com.apple.mobilesafari";
                UIApplicationLaunchOptionsUserActivityDictionaryKey =     {
                    UIApplicationLaunchOptionsUserActivityIdentifierKey = "XXXXXXXX-XXXX-XXXX-XXXX-B30B639D9909";
                    UIApplicationLaunchOptionsUserActivityKey = "<NSUserActivity: 0x60400022e1e0>";
                    UIApplicationLaunchOptionsUserActivityTypeKey = NSUserActivityTypeBrowsingWeb;
                };
             }
             */
            if let activityDictionary = options[.userActivityDictionary] as? [UIApplicationLaunchOptionsKey: Any] {
                if let activityType = activityDictionary[.userActivityType] as? String {
                    log(activityType)
                }
                if let activity = activityDictionary[.userActivity] as? NSUserActivity {
                    log(activity.webpageURL?.absoluteString ?? "")
                }
                if let identifier = activityDictionary[.userActivityIdentifier] as? String {
                    log(identifier)
                }
            }
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        log(#function)
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        log(#function)
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        log(#function)
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        log(#function)
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        log(#function)
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
        log(#function)
        log("userActivityType >>> \(userActivityType)")
        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        log(#function)
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb {
            log("webpageURL >>> \(userActivity.webpageURL!)")
        }
        return true
    }

    func application(_ application: UIApplication, didFailToContinueUserActivityWithType userActivityType: String, error: Error) {
        log(#function)
    }

    func application(_ application: UIApplication, didUpdate userActivity: NSUserActivity) {
        log(#function)
    }

    func prepareLogFile() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/ss HH:mm:ss"
        let dateString = formatter.string(from: Date())
        let text = """
        \n------------------------------------
        -----    \(dateString)   -----
        ------------------------------------
        """
        log(text)
    }
}
