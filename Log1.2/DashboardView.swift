//
//  DashboardView.swift
//  Log
//
//  Created by Daniel Rodosky on 1/14/15.
//  Copyright (c) 2015 Dan Rodosky. All rights reserved.
//

import UIKit

class DashboardView: UIViewController, UITableViewDelegate, UITableViewDataSource{
    //passed from signin
    var email = ""
    var passWord = ""
    
    var subjectData: [String] = ["Time Lapse", "Landscape", "Interview", "Life Style"]
    
    @IBOutlet weak var subjectTableView: UITableView!
    
    @IBOutlet weak var addTextfield: UITextField!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var locationTextfield: UITextField!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var dateTextfield: UITextField!
    
    //adds subjects to the subjects array
    @IBAction func addButton(sender: AnyObject) {
        subjectData.append(addTextfield.text)
        addTextfield.text = ""
        
        subjectTableView.reloadData()
        
        println(subjectData)
        println(email)
        println(passWord)
        
    }
    
    @IBAction func logButton(sender: AnyObject) {
        
    }
    //conects to the red SDK connect view controller
    @IBAction func connectButton(sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subjectTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.subjectTableView.dataSource = self
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 51
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return subjectData.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        cell.textLabel?.text = subjectData[indexPath.row] as String
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView?, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath?) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            if let tv = tableView {
                subjectData.removeAtIndex(indexPath!.row)
                tv.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
            }
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        var DestinationViewController : LogViewController = segue.destinationViewController as LogViewController
        
        DestinationViewController.email = email
        DestinationViewController.passWord = passWord
        DestinationViewController.location = locationTextfield.text
        DestinationViewController.date = dateTextfield.text
        
        DestinationViewController.subjectData = subjectData
        
        
    }
    
    
}
