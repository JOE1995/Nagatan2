//
//  AppDelegate.swift
//  Nagatan
//
//  Created by 矢吹祐真 on 2015/11/18.
//  Copyright © 2015年 矢吹祐真. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // Storyboardを分ける
    func grabStoryboard() -> UIStoryboard {
        var storyboard = UIStoryboard()
        let height = UIScreen.mainScreen().bounds.size.height
        
        //iPhone4s
        if height == 480 {
            storyboard = UIStoryboard(name: "Main3.5", bundle: nil)
            
            //iPhone5・5s・5c
        }else if height == 568 {
            storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            //iPhone6
        }else if height == 667 {
            storyboard = UIStoryboard(name: "Main4.7", bundle: nil)
            
            //iPhone6 Plus
        }else if height == 736 {
            storyboard = UIStoryboard(name: "Main5.5", bundle: nil)
            
            //iPad
        }else if height == 1024 {
            storyboard = UIStoryboard(name: "Sub", bundle: nil)
        } else{
            
        }
        return storyboard
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let storyboard: UIStoryboard = self.grabStoryboard()
        if let window = window {
            window.rootViewController = storyboard.instantiateInitialViewController()
        }
        self.window?.makeKeyAndVisible()
        
        
        return true
    }


    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

