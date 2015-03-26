import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var previousRatingLabel: UILabel!
    @IBOutlet weak var imageNameLabel: UILabel!
    @IBOutlet weak var scoreSlider: UISlider!
    @IBOutlet weak var commentField: UITextField!
    
    var previousRatings = [String:PhotoProperties]()
    var imageName = "Unknown"
    
    
    //This is where you define the different properties attributed to a photo
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
    
    //This is what someone clicks the button that says "next image"
    @IBAction func nextImageClicked(sender: AnyObject) {
        var newPhotoProperties = PhotoProperties(rating: Rating.Unknown, comment: commentField.text, score: scoreSlider.value)
        previousRatings[imageName] = newPhotoProperties
        showNextRandomImage()
    }
    
    //This is the one that says that you disliked the photo. Rating.Dislike
    @IBAction func swipedLeft(sender: AnyObject) {
        var newPhotoProperties = PhotoProperties(rating: Rating.Dislike, comment: commentField.text, score: scoreSlider.value)
        previousRatings[imageName] = newPhotoProperties
        showNextRandomImage()
    }
    
    //This is the one that says you liked the photo. Rating.Like
    @IBAction func swipedRight(sender: AnyObject) {
        var newPhotoProperties = PhotoProperties(rating: Rating.Like, comment: commentField.text, score: scoreSlider.value)
        previousRatings[imageName] = newPhotoProperties
        showNextRandomImage()
    }
    
    //This is the function to refresh the image and its associated content
    func showNextRandomImage() {
        let randomNumber = arc4random_uniform(10) + 1
        
        //this is how to "pad" the filename from a number to a number + .jpg
        imageName = randomNumber < 10 ? "0\(randomNumber).jpg" : "\(randomNumber).jpg"
        imageView.image = UIImage(named: imageName)
        
        //This shows the file name in the imageName field on the storyboard
        imageNameLabel.text = imageName
        
        //This points to the enum in "Rating.swift"
        if let previousRating = previousRatings[imageName] {
            previousRatingLabel.text = previousRating.rating.getDescription()
            scoreSlider.value = previousRating.score
            commentField.text = previousRating.comment
        } else {
            previousRatingLabel.text = Rating.Unknown.getDescription()
            scoreSlider.value = 0.0
            commentField.text = ""
        }
        
        
    }
    
    //This shows the first image when you open the app
    override func viewDidLoad() {
        super.viewDidLoad()
        showNextRandomImage()
    }
    
    //Here is how you shake to change photo - override
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if (motion == UIEventSubtype.MotionShake) {
            showNextRandomImage()
        }
    }
    
}







