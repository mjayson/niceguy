//
//  AppDelegate.swift
//  Compliment a day
//
//  Created by Matthew Jayson on 10/11/15.
//  Copyright © 2015 Matthew Jayson. All rights reserved.

//appdelegate is like the father of the app. applies globally to the app vs other files which are smaller and only relate to themselves


import UIKit
import Foundation
import Parse
import FBSDKCoreKit


var usedIndexes: [Int] = []
var Full_name: String = ""
var First_name: String = ""
var Last_name: String = ""

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // ASSIGNMENT INSERT HERE REGISTER FOR LOCAL NOTIFICATIONS
        
        if let options = launchOptions {
            if let notification = options[UIApplicationLaunchOptionsLocalNotificationKey] as? UILocalNotification {
                if let userInfo = notification.userInfo {
                    let customField1 = userInfo["CustomField1"] as! String
                    // do something neat here
                }
            }
        }
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
    }
    
    
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        if let userInfo = notification.userInfo {
            let customField1 = userInfo["CustomField1"] as! String
            print("didReceiveLocalNotification: \(customField1)")
        }
    }
    
    
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
        
    }
    
    
    func applicationWillResignActive(application: UIApplication) {
        
        
        
    }
    
    
    func applicationDidEnterBackground(application: UIApplication) {

        
        
    }
    
    
    func applicationWillEnterForeground(application: UIApplication) {

        
        
    }
    
    
    func applicationDidBecomeActive(application: UIApplication) {

        
        
    }
    
    
    func applicationWillTerminate(application: UIApplication) {

        
        
    }
    
}

