//
//  ViewController.swift
//  Storing Lists
//
//  Created by Caitlin Osbahr on 4/7/15.
//  Copyright (c) 2015 Caitlin Osbahr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var names : [String] {
        get {
            let path = NSBundle.mainBundle().pathForResource("beatles", ofType: "plist")
            var beatles = NSArray(contentsOfFile: path!)
            return beatles as [String]
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("nameCell") as UITableViewCell
        
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }


}

