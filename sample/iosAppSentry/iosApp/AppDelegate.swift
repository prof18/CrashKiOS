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

        do {
            Client.shared = try Client(dsn: "https://92460d6d1ec24f5bb6179284f3f8bc55@sentry.io/1833747")
            try Client.shared?.startCrashHandler()
        } catch let error {
            print("\(error)")
        }
        
        CrashIntegrationKt.crashInit(handler: SentryCrashHandler())

        return true
    }

    // MARK: UISceneSession Lifecycle

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
