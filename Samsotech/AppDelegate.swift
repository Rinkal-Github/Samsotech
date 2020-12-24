//
//  AppDelegate.swift
//  Samsotech
//
//  Created by Rinkal Saradva on 22/12/2020.
//

import UIKit
import IQKeyboardManagerSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
             IQKeyboardManager.shared.enable = true
             IQKeyboardManager.shared.shouldResignOnTouchOutside = true
           
        return true
    }



}

