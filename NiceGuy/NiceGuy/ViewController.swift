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

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet var daily_text: UILabel!
    
    let list_of_compliments: [String] = [
        "Your hair looks fantastic today",
        "Nice shirt!",
        "Wow, you have beuatiful eyes."
    ]
    
    //this function will show all the compliments, one after another
    func run_through_all() {
        daily_text.text = list_of_compliments[0]
        usleep(3000000)
        daily_text.text = list_of_compliments[1]
        usleep(1000000)
        daily_text.text = list_of_compliments[2]
        usleep(1000000)
    }
    
    override func viewDidAppear(animated:Bool) {
        
       daily_text.text = ""
        usleep(1000000)
        run_through_all()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
          daily_text.text = list_of_compliments[1]
        
        if list_of_compliments[1]=="Nice shirt" {
            print("true")
        }
        else {
            print("totally false bro")
        }
        
        if FBSDKAccessToken.currentAccessToken() == nil {
            print("Not logged in...")
        }
        else {
            print("Logged in...")
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

}

