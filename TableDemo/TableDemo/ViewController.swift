import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var rows = ["john", "ringo", "paul", "george"]

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("mycell") as UITableViewCell
        
        cell.textLabel!.text = rows[indexPath.row]
        
        return cell
    }
    


}

