import UIKit

class ImageLoaderController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func loadImage(sender: AnyObject) {
        var imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        imageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func tapped(sender: AnyObject) {
        loadImage("")
    }
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    @IBOutlet weak var dismissButton: UIButton!
    //This shows how you might use notifications rather than delegates
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var notify = NSNotificationCenter.defaultCenter()
        
        notify.addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        
        notify.addObserver(self, selector: Selector ("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification : NSNotification) {
        dismissButton.backgroundColor = UIColor.blueColor()
    }
    
    func keyboardWillHide(notification : NSNotification) {
        dismissButton.backgroundColor = UIColor.clearColor()
    }
    
    
    
}
