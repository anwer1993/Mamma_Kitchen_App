//
//  AppDelegate.swift
//  Mama's Kitchen Restaurant
//
//  Created by Anwar Hajji on 13/09/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let navBarAppearance = UINavigationBarAppearance()
           navBarAppearance.configureWithOpaqueBackground()
//           navBarAppearance.backgroundColor = UIColor.redBrown

           UINavigationBar.appearance().standardAppearance = navBarAppearance
        
        //        // mainStoryboard
        let mainStoryboard = UIStoryboard(name: "Authentication", bundle: nil)
        
        // rootViewController
        let rootViewController = mainStoryboard.instantiateViewController(withIdentifier: "SpalchScreen")
        
        // navigationController
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        navigationController.isNavigationBarHidden = true // or not, your choice.
        
        // self.window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window!.rootViewController = navigationController
        
        self.window!.makeKeyAndVisible()
        return true
    }

}

