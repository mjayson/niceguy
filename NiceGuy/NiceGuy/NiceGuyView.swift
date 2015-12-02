//
//  NiceGuyView.swift
//  NiceGuy
//
//  Created by Matthew Jayson on 11/24/15.
//  Copyright © 2015 Matthew Jayson. All rights reserved.
//

import UIKit
import Foundation
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit

class NiceGuyView: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet weak var compliment: UILabel!
    var logged_in: Bool = false
    var index_used: [Int] = []
    let baseUrl: String = "https://script.google.com/macros/s/AKfycbzMtEeu6mZamavU5zaalpYj4nw0lQ7K6ILC3QYKJZwt2HN5GeLQ/exec?"
    
    override func viewDidAppear(animated: Bool) {
        pullCompliment(randomInt(2, max: 126), user: First_name)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create Logout Button
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.center = self.view.center
        loginButton.center.y = loginButton.center.y + 150.0
        loginButton.delegate = self
        self.view.addSubview(loginButton)
    }
    func pullCompliment(index: Int, user: String) {
        
        let url: NSURL = NSURL(string: "\(baseUrl)user=\(user)&id=\(index)")!
        let request1: NSURLRequest = NSURLRequest(URL: url)
        var response: NSURLResponse? = nil
        var error: NSError? = nil
        let dataVal: NSData = try! NSURLConnection.sendSynchronousRequest(request1, returningResponse: &response)
        var err: NSError
        if let response = response as? NSHTTPURLResponse {
            if response.statusCode == 200 {
                print("Compliment API success!")
            }
        }
        var compStr = String(data: dataVal, encoding: NSUTF8StringEncoding)
        compStr = compStr!.stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        compliment.text = compStr?.lowercaseString
    }
    func randomInt(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
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