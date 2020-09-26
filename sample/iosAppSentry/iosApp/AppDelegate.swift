//
//  AppDelegate.swift
//  iosApp
//
//  Created by Kevin Galligan on 10/7/19.
//  Copyright © 2019 Kevin Galligan. All rights reserved.
//

import UIKit
import Sentry
import sample

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                
        SentrySDK.start { options in
            // TODO: replace with custom
//            options.dsn = "PUT YOUR KEY STRING HERE"
            options.dsn = "your dns"
            options.debug = true // Enabled debug when first installing is always helpful
            options.enableAutoSessionTracking = true // Enable session tracking
        }
        
        // TODO: replace it
       CrashIntegrationKt.crashInit(handler: SentryCrashHandler())
        
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

