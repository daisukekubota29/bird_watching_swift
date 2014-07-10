//
//  BirdDetailViewController.swift
//  BirdWatching
//
//  Created by daisuke.kubota on 2014/07/04.
//  Copyright (c) 2014年 daisuke.kubota. All rights reserved.
//

import UIKit

class BirdDetailViewController: UITableViewController {
    
    var sighting:BirdSighting?
    
    @IBOutlet var birdNameLabel: UILabel
    @IBOutlet var locationLabel: UILabel
    @IBOutlet var dateLabel: UILabel
    
    override func viewDidLoad() {
        super.viewDidLoad();
        configureView()
    }
    
    func setSighting(newSighting:BirdSighting!) {
        if (self.sighting != newSighting) {
            self.sighting = newSighting
            self.configureView()
        }
    }
    
    func configureView() {
        var theSighting:BirdSighting? = self.sighting
        let formatter:NSDateFormatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        self.birdNameLabel.text = theSighting?.name
        self.locationLabel.text = theSighting?.location
        self.dateLabel.text = formatter.stringFromDate(theSighting?.date)
    }
    
}
