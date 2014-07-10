//
//  BirdSightingDataController.swift
//  BirdWatching
//
//  Created by daisuke.kubota on 2014/07/04.
//  Copyright (c) 2014年 daisuke.kubota. All rights reserved.
//

import Foundation

class BirdSightingDataController: NSObject {
    var masterBirdSightingList:[BirdSighting] = Array<BirdSighting>()
    
    init() {
        super.init()
        self.initializeDefaultDataList()
    }
    
    func initializeDefaultDataList() {
        var birdSightingList = Array<BirdSighting>()
        self.masterBirdSightingList = birdSightingList;
        var today:NSDate = NSDate()
        var birdSighting:BirdSighting = BirdSighting(name:"Pigeon", location:"Everywhere", date:today)
        self.addBirdSightingWithSighting(birdSighting)
    }
    
    func countOfList() -> Int {
        return self.masterBirdSightingList.count
    }
    
    func objectInListAtIndex(var index:Int) -> BirdSighting {
        return self.masterBirdSightingList[index]
    }
    
    func addBirdSightingWithSighting(var birdSighting:BirdSighting) {
        self.masterBirdSightingList.append(birdSighting)
    }
    
    func setMasterBirdSightingList(birdSightingList:Array<BirdSighting>) {
        if (self.masterBirdSightingList != birdSightingList) {
            self.masterBirdSightingList = birdSightingList
        }
    }
    
}
