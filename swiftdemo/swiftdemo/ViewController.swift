//
//  ViewController.swift
//  swiftdemo
//
//  Created by Caitlin Osbahr on 2/19/15.
//  Copyright (c) 2015 Caitlin Osbahr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!


    @IBAction func buttonClicked(sender: AnyObject) {
        let name = nameField.text
        let welcomeMessage = sayHelloTo(name, day:"Thursday")
        let errorMessage = "Try again, homie"

        
        if(name.isEmpty) {
            messageLabel.backgroundColor = UIColor.redColor()
            messageLabel.text = errorMessage
        } else {
            messageLabel.backgroundColor = UIColor.clearColor()
            messageLabel.text = welcomeMessage
        }
        NSLog(welcomeMessage)
    }
    
    func sayHelloTo(name: String, day: String) -> String {
        return ("hello \(name), have a good \(day)")
    }
}

