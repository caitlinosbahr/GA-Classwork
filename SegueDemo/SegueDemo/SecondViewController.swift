import UIKit

class GreetingViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    
    var passedInName = "IDK"
    override func viewDidLoad() {
        greetingLabel.text = "Hello \(passedInName)"
    }

    @IBAction func thanksButtonClicked(sender: AnyObject) {
//        var button = sender as UIButton
//        button.setTitle("hey!", forState: UIControlState.Normal)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}