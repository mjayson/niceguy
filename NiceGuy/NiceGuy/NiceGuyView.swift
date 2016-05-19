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

let compliment_shared: [Int:String] = [
    1:"you have such nice hair.",
    2:"what a great shirt.",
    3:"everyone appreciates your point of view, keep speaking up!",
    4:"you have such great style.",
    5:"your T-shirt smells fresh.",
    6:"I really liked your last Facebook status.",
    7:"I like your shoes.",
    8:"you have real good taste in clothes.",
    9:"you look awesome today.",
    10:"you are full of youth.",
    11:"you're so smart.",
    12:"I like the way you move.",
    13:"your posture is pretty impressive. I couldn't do that!",
    14:"I wish I was your mirror.",
    15:"you're a fountain of inspiration.",
    16:"you have perfect bone structure.",
    17:"I disagree with anyone who disagrees with you.",
    18:"have you been working out?",
    19:"with your creative wit, I'm sure you could come up with better compliments than me.",
    20:"cool socks!",
    21:"you are so charming.",
    22:"you're tremendous!",
    23:"you deserve a compliment!",
    24:"your smile is breath taking.",
    25:"how do you get your hair to look that great?",
    26:"you are quite strapping.",
    27:"I am grateful to be blessed by your presence.",
    28:"say, aren't you that famous model from TV?",
    29:"your life is so interesting!",
    30:"the sound of your voice sends tingles of joy down my back.",
    31:"all of your ideas are brilliant!",
    32:"you're so spontaneous, and I love it!",
    33:"you would look good in glasses OR contacts.",
    34:"you're even cooler than Justin Timberlake.",
    35:"you're cooler than Pirates and Ninjas combined.",
    36:"you could go longer without a shower than most people.",
    37:"I like your pants.",
    38:"you're pretty groovy, dude.",
    39:"when I grow up, I want to be just like you.",
    40:"I told all my friends about how cool you are.",
    41:"I bet you can play any prank and get away with it.",
    42:"you have ten of the best fingers I have ever seen!",
    43:"you're sweeter than than a bucket of bon-bons!",
    44:"you are very well groomed.",
    45:"you could probably lead a rebellion.",
    46:"is it hot in here or is it just you?",
    47:"<3",
    48:"you are more fun than a Japanese steakhouse.",
    49:"your voice is more soothing than Morgan Freeman's.",
    50:"you could be drinking whole milk if you wanted to.",
    51:"you are as fun as a hot tub full of chocolate pudding.",
    52:"I don't speak much English, but with you all I really need to say is beautiful.",
    53:"your skin is radiant.",
    54:"you will still be beautiful when you get older.",
    55:"you make me :)",
    56:"you're nicer than a day on the beach.",
    57:"your glass is the fullest.",
    58:"you look so perfect.",
    59:"did you have braces?, Your teath are amazing.",
    60:"you look damn fit, yo.",
    61:"you complete me.",
    62:"be my valentine?",
    63:"I would do weird things to you, weird.",
    64:"can I buy you a drink?",
    65:"wanna Netflix and chill with me tonight?",
    66:"did you lose weight? You look great.",
    67:"everyone says the best things about you when you leave the rooom.",
    68:"your calves rock my socks.",
    69:"you should sing more. I like your voice.",
    70:"I love you more than bacon!",
    71:"you make me think of beautiful things, like strawberries.",
    72:"I would share my fruit Gushers with you.",
    73:"you're more fun than bubble wrap.",
    74:"you make the gloomy days a little less gloomy.",
    75:"you are warmer than a Snuggie.",
    76:"you make me feel like I am on top of the world.",
    77:"playing video games with you would be fun.",
    78:"let's never stop hanging out.",
    79:"you are a bucket of awesome.",
    80:"you are the star of my daydreams.",
    81:"if you really wanted to, you could probably get a bird to land on your shoulder and hang out with you.",
    82:"my mom always asks me why I can't be more like you.",
    83:"you listen to the coolest music.",
    84:"you and Chuck Norris are on equal levels.",
    85:"your body fat percentage is perfectly suited for your height.",
    86:"I am having trouble coming up with a compliment worthy enough for you.",
    87:"if we were playing kickball, I'd pick you first.",
    88:"you're the bee's knees.",
    89:"I wish I could choose your handwriting as a font.",
    90:"you definitely know the difference between your and you're.",
    91:"you can be so romantic when you want to be.",
    92:"if you were in a chemistry class with me, it would be 10x less boring.",
    93:"if you broke your arm, I would carry your books for you.",
    94:"you make me want to be the person I am capable of being.",
    95:"you're a skilled driver.",
    96:"I'd like to kiss you. Often.",
    97:"looking at you makes my foot cramps go away instantaneously.",
    98:"I like your face.",
    99:"even my cat likes you.",
    100:"I love you more than a drunk college student loves tacos."
]


class NiceGuyView: UIViewController{

    // Create usedIndexArray and put a single 0 in to start off
    var usedIndexArray: [Int] = [-1]
    
    var result: Int = -1
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    func set_array_to_default() {
        
        for index in 1...100 {
            usedIndexArray += [0]
            
        }
        defaults.setObject(usedIndexArray, forKey: "usedIndex")
    }
    
    
    @IBOutlet var compliment: UILabel!
    
    @IBOutlet weak var refreshButton: UIButton!
    
    @IBAction func btnFBLoginPressed(sender: AnyObject) {
        
        //fbLoginManager.logOut()
        
        FBSDKAccessToken.setCurrentAccessToken(nil)
        
        self.performSegueWithIdentifier("showLogin", sender: self)
        
    }
    
    @IBAction func refreshComplimentPressed(sender: AnyObject) {

        refreshButton.enabled = false
        
   //     displayUniqueCompliment()
        
        refreshButton.enabled = true
        
    }
    
    
    func randomInt(min: Int, max: Int) -> Int {
        
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
        
    }
    
    
    func display_unique_compliment(){
        
            // 2a: There are unused compliments left in the array
            if (usedIndexArray.contains(0) == true) {
                
                // i. Set result equal to a random number between 1 and 100
                result = randomInt(1, max: 100)
                
                // ii. Repeatedly pull a random number until the value of the index of that number does not equal -1
                while usedIndexArray[result] == -1 {
                    result = randomInt(1, max: 100)
                }
                
                // iii. set value of index equal to -1
                usedIndexArray[result] = -1
                
                //set nsuserdefault array at key usedIndex equal to usedIndexArray

                defaults.setObject(usedIndexArray, forKey: "usedIndex")
                
                // iv. display compliment
                compliment.text = compliment_shared[result]
                
                    print(result)
                
            }
                
                // 2b: We’ve run through all the compliments already
            else {
                // i. set all values in array to equal 0
              
                for index in 1...100 {
                    
                    usedIndexArray[index] = 0
                    
                }

                
                // store these values in nsuserdefaults

                defaults.setObject(usedIndexArray, forKey: "usedIndex")

                //send us back to the primary fucnction, now that we've reset the array
                display_unique_compliment()
                

                
            }
    }
    
    
    override func viewDidAppear(animated: Bool) {

        display_unique_compliment()
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        
        
    }
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        
        let Read_index = defaults.objectForKey("usedIndex") as? [Int]
        
        // if there's an array stored in NSUserDefaults then load it.
        if Read_index != nil {
            usedIndexArray = Read_index!
        
            //check array to see if there are any zeros in it
            if (usedIndexArray.contains(0) != true) {
            
                //if there is not a zero, then...replace values of array with 100 0s
                
                for index in 1...100 {
                    
                    usedIndexArray[index] = 0
                    
                }
                
                defaults.setObject(usedIndexArray, forKey: "usedIndex")
        
            }

        
        }
                
            //create new array with previous function and store values
        else{
            set_array_to_default()
        }
        
        //If not, then we create a new array
        
    }
        // Setup time and date for daily compliment delivery
}