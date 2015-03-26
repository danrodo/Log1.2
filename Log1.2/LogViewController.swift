//
//  LogViewController.swift
//  Log
//
//  Created by Daniel Rodosky on 1/15/15.
//  Copyright (c) 2015 Dan Rodosky. All rights reserved.
//

import UIKit

class LogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var email = ""
    var passWord = ""
    var location = ""
    var date = ""
    var subjectData = []
    var grade = ""
    var subject = ""
    var des = ""
    
    var statement = ""
    
    @IBOutlet weak var subjectTableView: UITableView!
    
    @IBOutlet weak var descriptTextfield: UITextField!
    
    @IBOutlet weak var gradeLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBAction func gradeButton(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            grade = "A+"
            println(grade)
        case 1:
            grade = "A"
            println(grade)
        case 2:
            grade = "B"
            println(grade)
        case 3:
            grade = "D"
            println(grade)
        case 4:
            grade = "F"
            println(grade)
        default:
            break;
        }
    }
    
    @IBAction func saveButton(sender: AnyObject) {
        //do networking here
        if(descriptTextfield.text != ""){
            des = descriptTextfield.text
        }
        else{
            des = "NULL"
        }
        if(location == ""){
            location = "NULL"
        }
        if(date == ""){
            date = "NULL"
        }
        if(grade == ""){
            grade = "A+"
        }
        if(subject == ""){
            subject = "NULL"
        }
        
        statement = "log:" + location + ":" + date + ":" + subject + ":" + grade + ":" + des + ":" + email
        println(statement)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationLabel.text = location
        self.dateLabel.text = date
        subjectTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.subjectTableView.dataSource = self
        self.subjectTableView.delegate = self
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
        
        cell.textLabel?.text = subjectData[indexPath.row] as? String
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        subject = subjectData[indexPath.row] as String
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
