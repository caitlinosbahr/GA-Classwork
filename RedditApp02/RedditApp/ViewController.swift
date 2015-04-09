import UIKit
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    //Changed this to a JSON object to use the SwiftyJSON pod
    var redditStories : JSON?
    
    //this is a refresh controller
    var refreshControl : UIRefreshControl?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: "loadDataFromReddit", forControlEvents: UIControlEvents.ValueChanged)
        
        //add the spinner
        tableView.addSubview(refreshControl!)
        loadDataFromReddit()
    }

    //this sets up that when you hit one of the rows, it passes the associated url and shows the web view screen
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let url = redditStories!["data"]["children"][indexPath.row]["data"]["url"].stringValue
        
        performSegueWithIdentifier("navToWebView", sender: url)
    }
    
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
            return redditStories!["data"]["children"].arrayValue.count
        }
    }
    
    //this takes the json and shows it in each cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("redditCell") as UITableViewCell
        
        cell.textLabel?.text = redditStories!["data"]["children"][indexPath.row]["data"]["title"].stringValue
        cell.detailTextLabel?.text = redditStories!["data"]["children"][indexPath.row]["data"]["author"].stringValue
        
        let url = redditStories!["data"]["children"][indexPath.row]["data"]["thumbnail"].stringValue
        let request = NSURLRequest(URL: NSURL(string: url)!)
        
        //clear out prev cell content
        cell.imageView?.image = nil
        cell.imageView?.cancelImageRequestOperation()
        
        //[weak cell] fixes potential memory leak
        cell.imageView?.setImageWithURLRequest(request, placeholderImage: nil, success: { [weak cell] (request, resposne, image) -> Void in
            cell!.imageView!.image = image
            cell!.setNeedsLayout() //makes the cell give space for images
            }, failure: nil)
        
        return cell
    }
    
    func loadDataFromReddit() {
        let url = NSURL(string: "http://www.reddit.com/.json")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            
            //this allows you to avoid crashes if the network is down - it will just return nothing instead
            if error != nil {
                return
            }
            
            //Got rid of the ugly parsing stuff
            self.redditStories = JSON(data: data)
            
            //this starts and stops loading the data into the table. without the .endRefreshing, the spinner would not stop.
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
            })
        })
        task.resume()
    }
}

