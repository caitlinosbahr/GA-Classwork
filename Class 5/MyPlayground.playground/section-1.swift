// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
Define a vehicle class
that has a number of wheels as a property and a purpose as a method
and define two subclasses, a bus and a bike that overrides purpose
*/

class Vehicle {
    var wheels : Int = 1
    
    func getPurpose() -> String {
        return "not sure!"
    }
}

class Bus : Vehicle{
    override init() {
        super.init()
        self.wheels = 4
    }
    override func getPurpose() -> String {
        return "getting to work"
    }
}

class Bike : Vehicle {
    override func getPurpose() -> String {
        return "fun trips"
    }
}

var aVehicle  = Vehicle()
aVehicle.getPurpose()

var aBike = Bike()
aBike.wheels = 2
aBike.getPurpose()

var aBus = Bus()
aBus.wheels = 4
aBus.getPurpose()
