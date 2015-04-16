//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Caitlin Osbahr on 4/9/15.
//  Copyright (c) 2015 Caitlin Osbahr. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadStudents()
        self.tableView.reloadData()
    }
    
    let managedContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    var students = [NSManagedObject]() //this says that students are one of the managed objects in core data
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func addStudent(sender: AnyObject) {
        var alert = UIAlertController(title: "Add Student", message: "Enter name", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addTextFieldWithConfigurationHandler { (textfield) -> Void in
            textfield.placeholder = "Student name"
        }
        
        var saveAction = UIAlertAction(title: "Save", style: .Default) { (action) -> Void in
            let name = (alert.textFields![0] as UITextField).text
            let student: AnyObject = NSEntityDescription.insertNewObjectForEntityForName("Student", inManagedObjectContext: self.managedContext!) //this creates a new student in the database
            
            student.setValue(name, forKey: "name") //this uses the value of the text field as the name attribute on student
            self.managedContext?.save(nil)
            
            self.loadStudents()
            self.tableView.reloadData()
        }
        
        alert.addAction(saveAction)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)) //this adds the action and sets the property in one line - shorter way of the save action above
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
    func loadStudents() {
        let fetchRequest = NSFetchRequest(entityName: "Student")
        if let fetchResults = managedContext?.executeFetchRequest(fetchRequest, error: nil) as [NSManagedObject]? {
            students = fetchResults
        }
    }
    
    
    @IBAction func resetClicked(sender: AnyObject) {
        
    }

    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        //
    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        let searchTerm = searchBar.text
        let fetchRequest = NSFetchRequest(entityName: "Student")
        let searchPredicate = NSPredicate(format: "name == %@", searchTerm)
        fetchRequest.predicate = searchPredicate
        
        if let fetchResults = managedContext?.executeFetchRequest(fetchRequest, error: nil) as [NSManagedObject]? {
            students = fetchResults
        }
        tableView.reloadData()
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("nameCell") as UITableViewCell
        
        let student = students[indexPath.row]
        cell.textLabel?.text = (student.valueForKey("name") as String)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }

    

}

