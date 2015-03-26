//
//  ViewController.swift
//  AnimationTest
//
//  Created by Caitlin Osbahr on 3/5/15.
//  Copyright (c) 2015 Caitlin Osbahr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var leftSpaceOnLabel: NSLayoutConstraint!

    @IBAction func showImage(sender: AnyObject) {
        fadeInImage()
        slideOutLabel()
    }
    
    func fadeInImage() {
        imageView.alpha = 0
        imageView.image = UIImage(named: "llama.jpg")
        UIView.animateWithDuration(1, animations: {
            self.imageView.alpha = 1
        })
    }

    func slideOutLabel() {
        UIView.animateWithDuration(1, animations: {
            self.leftSpaceOnLabel.constant = 200
            self.view.layoutIfNeeded()
        })
    }
}

