//
//  ViewController.swift
//  Log
//
//  Created by Daniel Rodosky on 1/13/15.
//  Copyright (c) 2015 Dan Rodosky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var email = ""
    var passWord = ""
    //Label for login view
    @IBOutlet var loginViewLabel: UILabel!
    
    //textfield for the users username
    @IBOutlet var userNameTextfield: UITextField!
    
    //textfield for the users password
    @IBOutlet var passwordTextfield: UITextField!
    
    //error alert for an unseccessful log in attempt
    let alert = UIAlertController(title: "Error", message: "Information Incorrect", preferredStyle: UIAlertControllerStyle.Alert)
    
    //button method to verify the users credentials
    @IBAction func verifyLogin(sender: AnyObject) {
        var un = "Dan"
        var pw = "dan1"
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        if userNameTextfield.text == un && passwordTextfield.text == pw {
            println("Info correct")
            email = un
            passWord = pw
            self.performSegueWithIdentifier("logInSuccessful", sender: self)
            
        }
        else {
            println("Info incorrect")
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func signUpButton(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "logInSuccessful"){
            var DestinationViewController : DashboardView = segue.destinationViewController as DashboardView
            
            DestinationViewController.email = email
            DestinationViewController.passWord = passWord
        }
        
    }
    
    
    
}

