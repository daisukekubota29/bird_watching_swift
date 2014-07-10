//
//  BirdMasterViewController.swift
//  BirdWatching
//
//  Created by daisuke.kubota on 2014/07/04.
//  Copyright (c) 2014年 daisuke.kubota. All rights reserved.
//

import UIKit

@objc(BirdMasterViewController) class BirdMasterViewController: UITableViewController {
    
    var dataController:BirdSightingDataController = BirdSightingDataController();
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var test:NSMutableArray?

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.dataController.countOfList();
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let CellIdentifier:String = "BirdSightingCell"
        let formatter: NSDateFormatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as UITableViewCell
        
        let birdSighting:BirdSighting = self.dataController.objectInListAtIndex(indexPath.row)
        cell.textLabel.text = birdSighting.name
        cell.detailTextLabel.text = formatter.stringFromDate(birdSighting.date)
        
        return cell;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier?.isEqual("ShowSightingDetails")) {
            var indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow();
            var birdSighting:BirdSighting = self.dataController.objectInListAtIndex(indexPath.row)
            var detailViewController:BirdDetailViewController = segue.destinationViewController as BirdDetailViewController
            detailViewController.sighting = birdSighting
        }
    }

    @IBAction func done(segue: UIStoryboardSegue) {
        if (segue.identifier?.isEqual("ReturnInput")) {
            var addController:AddSightingViewController = segue.sourceViewController as AddSightingViewController
            if (addController.birdSighting != nil) {
                self.dataController.addBirdSightingWithSighting(addController.birdSighting!)
                self.tableView.reloadData()
            }
            self.dismissViewControllerAnimated(true, completion: {})
        }
    }
    
    @IBAction func cancel(segue: UIStoryboardSegue) {
        if (segue.identifier?.isEqual("CancelInput")) {
            self.dismissViewControllerAnimated(true, completion:{})
        }
    }
    
}
