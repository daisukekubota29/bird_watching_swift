//
//  BirdSighting.swift
//  BirdWatching
//
//  Created by daisuke.kubota on 2014/07/04.
//  Copyright (c) 2014年 daisuke.kubota. All rights reserved.
//

import Foundation


class BirdSighting: NSObject {
    
    var name: String!
    var location: String!
    var date: NSDate!
    
    init(name: String!, location: String!, date: NSDate!) {
        self.name = name
        self.location = location;
        self.date = date;
        super.init()
    }
}