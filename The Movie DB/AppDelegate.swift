//
//  AppDelegate.swift
//  The Movie DB
//
//  Created by BIMSER on 25.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UserDefaultManager.LoginUserToken = ""
        UserDefaultManager.ApiKey = "e3e3629955e6c2f038f7663e474c440e"
        return true
    }

}

