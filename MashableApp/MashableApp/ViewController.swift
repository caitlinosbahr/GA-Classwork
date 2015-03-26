
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var mashableStories : NSArray?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataFromMashable()
    }
    
    //when the row is tapped, get the url and segue
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let story = mashableStories![indexPath.row] as NSArray
        let storyContent = story["content"] as NSArray
        
        performSegueWithIdentifier("segueToContent", sender: storyContent)
    }
    
    //to perform the segue we have to pass the url from this view to the next using the "prepare" func
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController is ContentViewController {
            var contentVC = segue.destinationViewController as ContentViewController
            contentVC.content = sender as String?
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mashableStories == nil {
            return 0
        } else {
            return mashableStories!.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mashableCell") as UITableViewCell
        
        let story = mashableStories![indexPath.row] as NSDictionary
        
        let title = story["title"] as String
        let author = story["author"] as String
        
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = author
        return cell
    }
    
    
    func loadDataFromMashable() {
        let url = NSURL(string: "http://mashable.com/stories.json")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            
            var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: nil) as NSDictionary
            
            self.mashableStories = responseDictionary["new"] as NSArray?
            
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
            })

            
        })
        
        task.resume()
    }
    
    
}

