//
//  AppDelegate.swift
//  Compliment a day
//
//  Created by Matthew Jayson on 10/11/15.
//  Copyright © 2015 Matthew Jayson. All rights reserved.
//

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
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        
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

