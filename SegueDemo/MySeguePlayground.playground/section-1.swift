// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class Vehicle {
    var numberWheels = 4
}

class Bus : Vehicle {
    func numberOfPassengers() -> Int {
        return 10
    }
}

class Bike : Vehicle {
}


var aBus = Bus()
aBus.numberWheels = 4

var aBike = Bike()
aBike.numberWheels = 2


//this "instance as class" format is called casting and is used for moving variables between segues
func printVehicleDetails(aVehicle : Vehicle) -> String {
    if aVehicle is Bus {
        var bus = aVehicle as Bus
        return "it's a bus with \(bus.numberOfPassengers()) people"
    }
    return "this has \(aVehicle.numberWheels)"
}

printVehicleDetails(aBus)
printVehicleDetails(aBike)


