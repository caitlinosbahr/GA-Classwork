import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var rows = [String]()
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    // this shows the keyboard right when the app opens
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.becomeFirstResponder()
    }
    
    // this makes the return field submit the form and dismiss the keyboard
    func textFieldShouldReturn (textField: UITextField) -> Bool {
        addName("")
        nameField.resignFirstResponder()
        return true
    }
    
    // this means that if you type in "Kitten" then the clear icon in the text field is not functional. 
    // The if/else statements all do the same thing but are styled differently
    func textFieldShouldClear(textField: UITextField) -> Bool {
//        if textField.text == "Kitten" {
//            return false
//        } else {
//            return true
//        }
        
//        return textField.text == "Kitten" ? false : true
        
        return textField.text != "Kitten"
    }
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var layoutGuideAboveButton: NSLayoutConstraint!
    
    @IBAction func addName(sender: AnyObject) {
        
        UIView.animateWithDuration(0.2, delay: 0, options: .CurveEaseIn, animations: {
            self.layoutGuideAboveButton.constant += 10
            self.view.layoutIfNeeded()
            }, completion: { (finished) in
                UIView.animateWithDuration(0.1, animations: {
                    self.layoutGuideAboveButton.constant = 22
                    self.nameField.text = ""
                    self.view.layoutIfNeeded()
                })
            }
        )
        
//        let options = UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.CurveEaseIn
//        
//        UIView.animateWithDuration(0.5, delay: 0, options: options, animations: {
//            self.tableView.backgroundColor = UIColor.grayColor()
//            }, completion: { (finished) in self.tableView.backgroundColor = UIColor.whiteColor()
//        })
        
        rows.append(nameField.text)
        tableView.reloadData()
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("myCell") as UITableViewCell

        
        //the subtraction thing adds the newest item to the top of the list
        cell.textLabel!.text = rows[rows.count - 1 - indexPath.row]
        return cell
    }
    
    
    
}

