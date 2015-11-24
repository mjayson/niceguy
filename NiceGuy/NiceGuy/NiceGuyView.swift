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

class NiceGuyView: UIViewController{

    @IBOutlet weak var compliment: UILabel!
    
    var logged_in: Bool = false
    var index_used: [Int] = []
    let baseUrl: String = "https://script.google.com/macros/s/AKfycbzMtEeu6mZamavU5zaalpYj4nw0lQ7K6ILC3QYKJZwt2HN5GeLQ/exec?"
    
   
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
        let compStr = String(data: dataVal, encoding: NSUTF8StringEncoding)
        compliment.text = compStr
    }
    
    func randomInt(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    override func viewDidAppear(animated: Bool) {
        pullCompliment(randomInt(2, max: 60), user: "Matt")
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}