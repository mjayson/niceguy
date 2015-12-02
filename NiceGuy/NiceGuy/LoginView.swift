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

var Full_name: String = ""
var First_name: String = ""
var Last_name: String = ""


class LoginView: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidAppear(animated: Bool) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if FBSDKAccessToken.currentAccessToken() == nil {
            print("Not logged in...")
        }
        else {
            print("Logged in...")
            returnUserData()
            self.performSegueWithIdentifier("showNew", sender: self)
        }
        
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.center = self.view.center
        loginButton.delegate = self
        self.view.addSubview(loginButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        if error == nil {
            print("Login complete!")
            self.performSegueWithIdentifier("showNew", sender: self)
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
            if ((error) != nil){
                // Process error
                print("Error: \(error)")
            }
            else{
                let userName : NSString = result.valueForKey("name") as! NSString
                Full_name = userName as String
                First_name = (Full_name.componentsSeparatedByString(" ")[0])
                print(First_name)
            }
        })
    }
}