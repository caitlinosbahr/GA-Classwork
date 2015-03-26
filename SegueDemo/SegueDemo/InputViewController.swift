import UIKit

class InputViewController: UIViewController {


    @IBOutlet weak var nameInput: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "hello" {
            var destinationVC = segue.destinationViewController as GreetingViewController
            destinationVC.passedInName = nameInput.text
        }
    }
}