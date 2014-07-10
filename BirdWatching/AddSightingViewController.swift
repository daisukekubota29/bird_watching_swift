//
//  AddSightingViewController.swift
//  BirdWatching
//
//  Created by daisuke.kubota on 2014/07/08.
//  Copyright (c) 2014年 daisuke.kubota. All rights reserved.
//

import UIKit

class AddSightingViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet var birdNameInput: UITextField
    @IBOutlet var locationInput: UITextField
    
    var birdSighting: BirdSighting?
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        if (textField == birdNameInput || textField == locationInput) {
            textField.resignFirstResponder();
        }
        return true;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier?.isEqual("ReturnInput")) {
            let birdName:String = self.birdNameInput.text
            let location:String = self.locationInput.text
            if (countElements(birdName) > 0 && countElements(location) > 0) {
                self.birdSighting = BirdSighting(name:self.birdNameInput.text, location:self.locationInput.text, date:NSDate())
            }
//            if (!self.birdNameInput.text.isEmpty && !self.locationInput.text.isEmpty) {
//                self.birdSighting = BirdSighting(name:self.birdNameInput.text, location:self.locationInput.text, date:NSDate())
//            }
        }
    }
    
}
