//
//  ViewController.swift
//  Files Demo
//
//  Created by Caitlin Osbahr on 4/7/15.
//  Copyright (c) 2015 Caitlin Osbahr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var todos = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = pathToFile {
            if let items = NSArray(contentsOfURL: path) as? [String] {
                self.todos = items
            }
        }
    }
    
    var pathToFile : NSURL? {
        get {
            let filename = "todos.plist"
            let docDirectory = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).last as NSURL
            let url = docDirectory.URLByAppendingPathComponent(filename)
            return url
        }
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addItem(sender: AnyObject) {
        
        let input = UIAlertController(title: "New item", message: "Type in your task", preferredStyle: UIAlertControllerStyle.Alert)
        
        input.addTextFieldWithConfigurationHandler { (textfield) -> Void in
        }
        
        let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default) { (action) -> Void in
            let newTodo = input.textFields![0] as UITextField
            self.todos.append(newTodo.text)
            
            (self.todos as NSArray).writeToURL(self.pathToFile!, atomically: true)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default) {
            (action) -> Void in
        }
        
        input.addAction(saveAction)
        input.addAction(cancelAction)
        
        presentViewController(input, animated: true, completion: nil)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("todoCell") as UITableViewCell
        cell.textLabel?.text = todos[indexPath.row]
        return cell
    }
    

}

