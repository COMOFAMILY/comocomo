//
//  ThirdViewController.swift
//  comocomo
//
//  Created by 양윤영 on 2016. 3. 7..
//  Copyright © 2016년 양윤영. All rights reserved.
//

import Foundation
import FBSDKLoginKit


import UIKit

class ThirdViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    var facebookLoginButton = FBSDKLoginButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if FBSDKAccessToken.currentAccessToken() == nil {
            print("Not logged in..")
        } else {
            print("Logged in..")
        }
        
        facebookLoginButton.readPermissions = ["public_profile", "email", "user_friends"]
        facebookLoginButton.delegate = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        if error == nil {
            print("Login complete")
            self.performSegueWithIdentifier("goHome", sender: self)
            
        } else {
            print(error.localizedDescription)
        }
    }
    
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User logged out...")
    }
    
}