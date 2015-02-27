// Playground - noun: a place where people can play

import UIKit

let str = "Hello, playground"

println(str)

5+5

let welcome = "hello"
let name : String = "caitlin"
let currentYear : Int = 2015

var friendsName : String

let welcomemessage = welcome + " " + name

let nicermessage = "hello \(name)!"

//this is a comment. you can use cmd slash to automatically put a comment in the line/s you have selected


//These are some types you might want to declare
//String
//Int - single integer (rounded)
//Float
//Double - specific (decimal point, for example 10.1)

var number : Double = 10.011

//this is how you might take a number and add it to a string - "Casting" or converting to a different type
welcome + String(1)

//this is a modulo or remainder operator - tells you how much is left after dividing. if modulo result is 0, it's even. if not, it's odd
10 % 2
11 % 2


// == asks if something is equal (true or false)

var k = 2

if k == 2{
    println("k is 2")
}

if k % 2 == 0 {
    println("k is even")
} else {
    println("k is odd")
}

if k % 3 == 1 {
    println("remainder is 1")
} else if k % 3 == 2 {
    println("derp")
}


//how to verify if a variable or constant has certain things
nicermessage.isEmpty
nicermessage.hasSuffix("!")
nicermessage.hasPrefix("h")

//how to generate a random number under a certain n
arc4random_uniform(60)


//create a thing called temp and describe how the weather is using conditionals
let temp = arc4random_uniform(100)

if temp < 20 {
    println("It's too cold.")
} else if temp >= 60 {
    println("Spring time!")
} else {
    println("Still chilly.")
}

if temp  < 20 {
    println("brr")
} else if temp >= 20 && temp < 60 {
    println("getting warmer")
} else {
    println("yay spring")
}


let naame = "marcio"
if naame == "marcio" {
 println("yay marcio")
}


//arrays
var myFavoriteColors : [String] = ["Green", "Purple", "Red"]
myFavoriteColors.count
myFavoriteColors.capacity
var myOtherColors = ["Blue"]

//how to add something to an array
var allColors = myFavoriteColors + myOtherColors + ["Black"]
myFavoriteColors.append("Derp")

//how to replace something in an array. you can only do this if it's a var, not a let
myFavoriteColors[0] = "Yellow"
myFavoriteColors

//how to find something in an array
myFavoriteColors.first
myFavoriteColors.last



//Loops!
var boroughs = ["Manhattan", "Queens", "Brooklyn", "Bronx", "Staten Island"]

//for loop, increment by 1
for var i = 0; i < boroughs.count; i++ {
    println("The borough is \(boroughs[i])")
}
//increment by 2 and print which iterator it is
for var i = 0; i < boroughs.count; i += 2{
    println("The borough is \(boroughs[i]), the i is \(i)")
}

//for loop fast enumeration
for thing in boroughs {
    println("\(thing) using forin")
}

//while loop
var boroughCount = 0
while boroughCount < 4 {
    boroughCount++
    println("current borough is \(boroughs[boroughCount])")
}


//range operator
for i in 1...10 {
    println(i)
}



//functions
func sayHello() {
    println("Hello world")
}

sayHello()


var finalMessage = sayHelloTo("cait", "thursday")
var anotherMessage = sayHelloTo("dude", "thursday")