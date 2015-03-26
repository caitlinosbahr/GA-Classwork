
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var redditStories : NSArray?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadDataFromReddit()
    }
    
    //when the row is tapped, get the url and segue
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let child = redditStories![indexPath.row] as NSDictionary
        
        let childsData = child["data"] as NSDictionary

        let url = childsData["url"] as String
        
        performSegueWithIdentifier("navToWebView", sender: url)
    }
    
    //to perform the segue we have to pass the url from this view to the next using the "prepare" func
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController is WebViewController {
            var webViewVC = segue.destinationViewController as WebViewController
            webViewVC.URL = sender as String?
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if redditStories == nil {
            return 0
        } else {
            return redditStories!.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("redditCell") as UITableViewCell
        
        let child = redditStories![indexPath.row] as NSDictionary
        
        let childsData = child["data"] as NSDictionary
        let title = childsData["title"] as String
        let author = childsData["author"] as String
        
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = author
        return cell
    }
    

    func LoadDataFromReddit() {
        let url = NSURL(string: "http://www.reddit.com/.json")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
        
            var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: nil) as NSDictionary
            
            var dataDictionary = responseDictionary["data"] as NSDictionary
            self.redditStories = dataDictionary["children"] as NSArray?
        
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
            })
        })
        
        task.resume()
    }


}

