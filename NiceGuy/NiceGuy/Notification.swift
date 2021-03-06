//
//  Notification.swift
//  NiceGuy
//
//  Created by Matthew Jayson on 5/13/16.
//  Copyright © 2016 Matthew Jayson. All rights reserved.
//

import Foundation
import UIKit



class NotificationView: UIViewController{

    var permissionCheckTimer: NSTimer?

    @IBAction func PressSoundsGood(sender: AnyObject) {
        //trigger notifcation alert from iOS
        
        permissionCheckTimer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "checkPermission", userInfo: nil, repeats: true)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let PermissionFlag = defaults.integerForKey("PermissionYet")
        
        if PermissionFlag == 1 {

            var alertController = UIAlertController (title: "Ready?", message: "1st click Notifications, 2nd click Allow", preferredStyle: .Alert)
            
            var settingsAction = UIAlertAction(title: "Notifications", style: .Default) { (_) -> Void in
                let settingsUrl = NSURL(string: UIApplicationOpenSettingsURLString)
                if let url = settingsUrl {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            
            var cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
            alertController.addAction(settingsAction)
            alertController.addAction(cancelAction)
            
            presentViewController(alertController, animated: true, completion: nil);
            
        }
        
        else{
            //record that we're prompting them
            
            defaults.setInteger(1, forKey: "PermissionYet")

            
            //prompt them

            let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
            UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)

            
        }
       
        
        let currentSettings = UIApplication.sharedApplication().currentUserNotificationSettings()
        
        if currentSettings!.types != .None {
            print("notifications enabled yo!")
            self.performSegueWithIdentifier("NotificationsToCompliment", sender: self)
        }
    }
    
    
    func checkPermission() {
        let currentSettings = UIApplication.sharedApplication().currentUserNotificationSettings()
        
        if currentSettings!.types != .None {
            print("notifications enabled yo!")
            self.performSegueWithIdentifier("NotificationsToCompliment", sender: self)
        
        
        
        }

        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        
    }
    
    
    
    
    
    override func viewDidLoad() {
      
        let defaults = NSUserDefaults.standardUserDefaults()
        
    
        let PermissionFlag = defaults.integerForKey("PermissionYet")
    
    // if there's an array stored in NSUserDefaults then load it.
        if !(PermissionFlag == 1 || PermissionFlag == -1) {
    
            defaults.setInteger(-1, forKey: "PermissionYet")
            
        }
        if PermissionFlag == -1{
    
            self.performSegueWithIdentifier("NotificationsToCompliment", sender: self)
            
        }
    }
    
    
    
    
    
    
    
    //for later, when we want to transition to the compliment screen
//    self.performSegueWithIdentifier("NotificationTo Compliment", sender: self)



}
