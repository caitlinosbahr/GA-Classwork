//
//  ViewController.swift
//  Settings Demo
//
//  Created by Caitlin Osbahr on 4/7/15.
//  Copyright (c) 2015 Caitlin Osbahr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateName()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateName", name: NSUserDefaultsDidChangeNotification, object: nil)
    }


    func updateName(){
        let name = NSUserDefaults.standardUserDefaults().stringForKey("name_preferences")
        
        nameField.text = name
    }

    @IBAction func showSettings(sender: AnyObject) {
        let settingsURL = UIApplicationOpenSettingsURLString
        UIApplication.sharedApplication().openURL(NSURL(string: settingsURL)!)
        
    }
    
}

