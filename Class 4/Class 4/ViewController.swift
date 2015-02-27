//
//  ViewController.swift
//  Class 4
//
//  Created by Caitlin Osbahr on 2/24/15.
//  Copyright (c) 2015 Caitlin Osbahr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttonClicked(sender: AnyObject) {
        setViewsToRandomColors()
    }
    
    @IBAction func swipedUp(sender: AnyObject) {
        setViewsToRandomColors()
    }
    
    
    func makeRandomColor() -> UIColor {
        let redComp = CGFloat(arc4random_uniform(100))/100
        let greenComp = CGFloat(arc4random_uniform(100))/100
        let blueComp = CGFloat(arc4random_uniform(100))/100
        
        let randomColor = UIColor(red: redComp, green: greenComp, blue: blueComp, alpha: 1)
            
        return randomColor
    }
    
    func setViewsToRandomColors() {
        label.backgroundColor = makeRandomColor()
        self.view.backgroundColor = makeRandomColor()
    }
        


}

