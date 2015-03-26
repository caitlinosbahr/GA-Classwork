import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var button = UIButton(frame: CGRect(x: 20, y: 30, width: 50, height: 50))
        button.setTitle("hello", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.redColor()
        self.view.addSubview(button)
        
        var blueView = UIView(frame: CGRect(x: 50, y: 50, width: 10, height: 50))
        blueView.backgroundColor = UIColor.blueColor()
        self.view.addSubview(blueView)
    }
    
    @IBAction func loadRandomViews(sender: AnyObject) {
        for i in 1...20{
            let randomX = Int(arc4random_uniform(300))
            let randomY = Int(arc4random_uniform(500))
            let randomWidth = Int(arc4random_uniform(60))
            let randomHeight = Int(arc4random_uniform(60))
            
            let redComp = CGFloat(arc4random_uniform(100))/100
            let greenComp = CGFloat(arc4random_uniform(100))/100
            let blueComp = CGFloat(arc4random_uniform(100))/100
            
            let randomView = UIView(frame: CGRect(x: randomX, y: randomY, width: randomWidth, height: randomHeight))
            randomView.backgroundColor = UIColor(red: redComp, green: greenComp, blue: blueComp, alpha: 1)
            randomView.alpha = 0
            
            let interval = Double(i) + 0.1
            self.view.addSubview(randomView)
            
            UIView.animateWithDuration(interval, delay: 0.0, options: .CurveEaseOut, animations: {
                randomView.alpha = 1.0
            }, completion: nil)
        }
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if motion == UIEventSubtype.MotionShake {
            removeAllChildren()
            loadRandomViews("")
        }
    }
    
    func removeAllChildren() {
        let children = self.view.subviews
        for child in children {
            child.removeFromSuperview()
        }
    }
        
    

}




