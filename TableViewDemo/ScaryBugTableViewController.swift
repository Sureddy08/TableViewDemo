//
//  ScaryBugTableViewController.swift
//  TableViewDemo
//
//  Created by VKS on 3/21/16.
//  Copyright © 2016 VKS. All rights reserved.
//

import UIKit

class ScaryBugTableViewController: UITableViewController {
    
    //var scaryBugs:[ScaryBug]!
    var bugSections = [BugSection]()
    
    @IBOutlet weak var bugTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //scaryBugs = ScaryBug.bugs()
        self.navigationItem.title = "Scary Bugs"
        self.navigationItem.rightBarButtonItem = editButtonItem()
        setupBugs()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupBugs(){
     bugSections.append(BugSection(howScary: .NotScary))
     bugSections.append(BugSection(howScary: .ALittleScary))
     bugSections.append(BugSection(howScary: .AverageScary))
     bugSections.append(BugSection(howScary: .QuiteScary))
     bugSections.append(BugSection(howScary: .Aiiiiieeeee))
     
        let bugs = ScaryBug.bugs()
        for bug in bugs{
        let bugSection = bugSections[bug.howScary.rawValue]
            bugSection.bugs.append(bug)
        }
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        if(editing){
        self.bugTableView.setEditing(editing, animated: true)
        }
       
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return bugSections.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bugSections[section].bugs.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ScaryBug.scaryFactorToString(bugSections[section].howScary)
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        let scaryBug = bugSections[indexPath.section].bugs[indexPath.row]
        cell.imageView?.image = scaryBug.image
        cell.textLabel?.text = scaryBug.name
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            bugSections[indexPath.section].bugs.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
