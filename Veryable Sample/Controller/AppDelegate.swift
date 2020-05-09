//
//  AppDelegate.swift
//  Veryable Sample
//
//  Created by Pooja Kaluskar on 3/27/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import UIKit
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //start checking for network connection since app data is dependent on status
        print(NetworkHelper.shared.isConnected)
               
        let homeViewController = HomeViewController()
        homeViewController.modalTransitionStyle = .crossDissolve
        
        let navController = UINavigationController(rootViewController: homeViewController)
        //configure nav bar style globally
        navController.navigationBar.titleTextAttributes = [.font: UIFont.vryAvenirNextRegular(20)!,
                                                           .foregroundColor: UIColor.vryGreyDark()]
        navController.navigationBar.tintColor = UIColor.vryGreyDark()
        navController.delegate = homeViewController
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {}
    func applicationDidEnterBackground(_ application: UIApplication) {}
    func applicationWillEnterForeground(_ application: UIApplication) {}
    func applicationDidBecomeActive(_ application: UIApplication) {}
    func applicationWillTerminate(_ application: UIApplication) {}

}

