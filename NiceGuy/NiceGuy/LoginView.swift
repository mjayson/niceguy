//
//  ViewController.swift
//  Compliment a day
//
//  Created by Matthew Jayson on 10/11/15.
//  Copyright © 2015 Matthew Jayson. All rights reserved.
//

import UIKit
import Foundation
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit


class LoginView: UIViewController, FBSDKLoginButtonDelegate {

    
    override func viewDidAppear(animated: Bool) {
        
        if FBSDKAccessToken.currentAccessToken() == nil {
            
            print("Not logged in...")
            
            let loginButton = FBSDKLoginButton()
            
            loginButton.readPermissions = ["public_profile", "email", "user_friends"]
            
            loginButton.center = self.view.center
            
            loginButton.delegate = self
            
            self.view.addSubview(loginButton)
            
        }
            
        else {
            
            print("Logged in...")
            
            returnUserData()
            
        }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        // Load usedIndexes into our global array
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let usedIndexesTemp = defaults.arrayForKey("usedIndexes") as? [Int] {
            
            usedIndexes = usedIndexesTemp
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }

    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        if error == nil {
            
            print("Login complete!")
            
            let settings = UIApplication.sharedApplication().currentUserNotificationSettings()
            
            if settings!.types == .None {
                
                self.performSegueWithIdentifier("HasNotApprovedNotifications", sender: self)
                
            }
                
                
                //if he  has given us pemrission for notifications, transition to compliment view
            else{
                self.performSegueWithIdentifier("showNew", sender: self)
                
            }
            
        }
            
        else {
            
            print(error.localizedDescription)
            
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
        print("User logged out...")
        
    }
   
    
    func returnUserData() {
        
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil) {
                
                print("Error: \(error)")
                
            }
                
            else {
                
                let userName : NSString = result.valueForKey("name") as! NSString
                
                Full_name = userName as String
                
                First_name = (Full_name.componentsSeparatedByString(" ")[0])
                
                print("First name: \(First_name)")
                
                
                //if we have not asked user permission for push notifications or he has rejected, then transition user to Notification view
        
                let settings = UIApplication.sharedApplication().currentUserNotificationSettings()
                
                if settings!.types == .None {
                    
                    self.performSegueWithIdentifier("HasNotApprovedNotifications", sender: self)
                    
                }
                    
                    
                //if he  has given us pemrission for notifications, transition to compliment view
                else{
                    self.performSegueWithIdentifier("showNew", sender: self)

                }
                
            }
            
        })
        
    }
    
}