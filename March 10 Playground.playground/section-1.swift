// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Vehicle {
    
}

class Bus : Vehicle {
    
}

class Bike : Vehicle {
    
}

class Animal {
    
}

class Dog : Animal, MakesSound {
    func sound() -> String {
        return "Woof"
    }
}

class Cat : Animal, MakesSound {
    func sound() -> String {
        return "Meow"
    }
}

protocol MakesSound {
    func sound() -> String
}

func printTheSoundItMakes(object : MakesSound) -> String {
    return object.sound()
}

let aDog = Dog()
let aCat = Cat()

printTheSoundItMakes(aDog)
printTheSoundItMakes(aCat)
