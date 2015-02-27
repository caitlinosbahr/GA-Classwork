//  ViewController.swift
//  Updating Lecture 4 to Lecture 5 stuff


import UIKit

class ViewController: UIViewController {
    //outlets are how you connect a thing in the storyboard to a thing in code. the exclamation point makes it "non optional" - it can't be nil.
    @IBOutlet weak var labelField: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var filenameField: UILabel!
    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var scoreSlider: UISlider!
    
    //previousRating points to an empty dictionary - a pair of keys and values
    var previousRating = [String: Rating]()
    
    //you define this variable here so that it's available for the whole view controller - this is how we can do the function that remembers ratings
    var fileName = "Unknown"
    
    class PhotoProperties {
        var rating : Rating
        var comment : String
        var score : Float
        
        init(rating : Rating, comment : String, score : Float){
            self.rating = rating
            self.comment = comment
            self.score = score
        }
    }
    
    
    
    //Actions are how attribute behaviors to a thing on the storyboard. So if you want someone to be able to click a button, you have to add an action on the button. This button randomizes the color AS WELL as updating the image
    
    @IBAction func randomNew(sender: AnyObject) {
        //setViewsToRandomColors()
        updateImageAndRating()
    }
    
    //this function shows a random image and its rating description, defined in another swift file
    func updateImageAndRating() {
        //get a random number from 1-10. +1 is added because counting starts at 0
        let randomInt = arc4random_uniform(9) + 1
        
        //if random number is less than 10, then add a 0 to the beginning of the number. this is the "padded" file name - not putting let in front of this lets you update the text
        fileName = randomInt < 10 ? "0\(randomInt).jpg" : "\(randomInt).jpg"
        
        //this tells the imageview to show the thing with the padded filename above
        imageView.image = UIImage(named: fileName)
        
        //this shows the rating that you gave it the previous time you saw it by swiping. this finds the result in the "previousRating" dictionary
        if previousRating[fileName] !=  nil {
            ratingLabel.text = previousRating[fileName]?.getDescription()
        } else {
            ratingLabel.text = Rating.Unknown.getDescription()
        }
        
        //this shows the filename in the text field that we named above with an outlet
        filenameField.text = fileName
    }
    
    //this function shows a random image once the app loads so it's not blank!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateImageAndRating()
    }
    

    

    //these functions are storing a rating to an image, and using the function "updateImageandRating" to present a new random image
    @IBAction func swipedRight(sender: AnyObject) {
        var newPhotoProperties = PhotoProperties(rating: Rating.Like, comment: "", score: 0.0)
        updateImageAndRating()
    }
    
    @IBAction func swipedLeft(sender: AnyObject) {
        var newPhotoProperties = PhotoProperties(rating: Rating.Dislike, comment: "", score: 0.0)
        updateImageAndRating()
    }
    

  
    
  //this is some random old crap about setting random colors
    
    @IBAction func swipedUp(sender: AnyObject) {
        setViewsToRandomColors()
    }
    
    
    func setViewsToRandomColors() {
        labelField.backgroundColor = makeRandomColor()
        
        self.view.backgroundColor = makeRandomColor()
    }
    
    func makeRandomColor() -> UIColor {
        
        let redComp = CGFloat(arc4random_uniform(100))/100
        let greenComp = CGFloat(arc4random_uniform(100))/100
        let blueComp = CGFloat(arc4random_uniform(100))/100
        
        let randomColor = UIColor(red: redComp, green: greenComp, blue: blueComp, alpha: 1.0)
        
        return randomColor
        
    }
}
