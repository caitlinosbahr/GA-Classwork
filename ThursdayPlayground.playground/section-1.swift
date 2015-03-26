// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var fileName = "11.jpg"


func showNextRandomImage() {
    let randomNumber = arc4random_uniform(10) + 1
    fileName = randomNumber < 10 ? "0\(randomNumber).jpg" : "\(randomNumber).jpg"
}

showNextRandomImage()
fileName

var greeting : String? = "hello world"

greeting = nil

greeting = "good evening"
//greeting = nil
greeting!





var states = ["NY": "New York", "RI" : "Rhode Island"]

states["NY"]
states["CT"]


func getState(abbrev: String) -> String? {
    return states[abbrev]
}


//--------------

UIColor.redColor()

class Square {
    var sideLength : Int
    
    init(sideLength: Int){
        self.sideLength = sideLength
    }
    
    func getArea() -> Int{
        return sideLength * sideLength
    }
}

var mySquare = Square(sideLength: 10)

mySquare.sideLength
//mySquare.getArea()


var anotherSquare = Square(sideLength: 30)
anotherSquare.sideLength
//anotherSquare.getArea()

class Rectangle : Square {
    var anotherSide : Int = 12
    
    override func getArea() -> Int {
        return sideLength * anotherSide
    }
}

var aRectangle = Rectangle(sideLength: 15)
aRectangle.sideLength = 15
aRectangle.getArea()



/*
Define a Vehicle class
that has number of wheels as a property and a purpose as a method
and define two subclasses, a Bus and Bike that overrides purpose
*/


class Vehicle {
    var numberOfWheels = 0
    
    func getPurpose() -> String {
        return "don't know"
    }
}

class Bike : Vehicle {
    override init() {
        super.init()
        self.numberOfWheels = 2
    }
    override func getPurpose() -> String {
        return "riding around town"
    }
}

class Bus : Vehicle {
    override func getPurpose() -> String {
        return "driving other people around"
    }
}


var aVehicle = Vehicle()
aVehicle.getPurpose()

var aBike = Bike()
aBike.numberOfWheels
aBike.getPurpose()

var aBus = Bus()
aBus.numberOfWheels = 4
aBus.getPurpose()














