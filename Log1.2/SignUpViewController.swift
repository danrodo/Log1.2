//
//  SignUpViewController.swift
//  Log
//
//  Created by Daniel Rodosky on 1/14/15.
//  Copyright (c) 2015 Dan Rodosky. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var fNameTextfield: UITextField!
    @IBOutlet var lNameTextfield: UITextField!
    @IBOutlet var pwTextfield: UITextField!
    @IBOutlet var confPwTextfield: UITextField!
    
    //error alert if passwords do not match
    let alert = UIAlertController(title: "Error", message: "Passwords do not match", preferredStyle: UIAlertControllerStyle.Alert)
    //error if password doesnt meet requirements
    let alert1 = UIAlertController(title: "Error", message: "Passwords must be 8 characters long", preferredStyle: UIAlertControllerStyle.Alert)
    //error for unfilled requirements
    let alert2 = UIAlertController(title: "Error", message: "Please fill in all text fields", preferredStyle: UIAlertControllerStyle.Alert)
    
    //this button handles all of the error checking for the sign up, and generates the statement to send to the server
    @IBAction func submitButton(sender: AnyObject) {
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        alert1.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        alert2.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        let statement = "signup" + ":" + emailTextfield.text + ":" + fNameTextfield.text + ":" + lNameTextfield.text + ":" + pwTextfield.text
        let length = countElements(pwTextfield.text)
        if(emailTextfield.text.isEmpty || fNameTextfield.text.isEmpty || lNameTextfield.text.isEmpty){
            println("not all required text fields are filled in")
            self.presentViewController(alert2, animated: true, completion: nil)
        }
        if(pwTextfield.text != confPwTextfield.text) {
            println("passwords dont match")
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else if( length < 8){
            println("must be 8 characters")
            self.presentViewController(alert1, animated: true, completion: nil)
        }
        else{
            println("success")
            println(statement)
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
