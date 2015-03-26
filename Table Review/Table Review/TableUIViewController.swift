import UIKit

class TableUIViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    //yo, don't forget to hook up your delegates for this to even work
    
//    var names = [String]()
    
    var storage = NSUserDefaults.standardUserDefaults()
    let storageKey = "names"
    
    var names : [String] {
        get {
            var storedValue = storage.arrayForKey("names") as [String]?
            if storedValue == nil {
                return [String]()
            } else {
                return storedValue!
            }
        }
        set {
            storage.setObject(newValue, forKey: storageKey)
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("myCell") as ColorCell
        
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    // This is how you get to add a thing from a text field into the table. You have to add both as outlets first and set the view as the nameField delegatex
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        names.append(nameField.text)
        tableView.reloadData()
        return true
    }
}