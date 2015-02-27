// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//"Write a program that prints the numbers from 1 to 100. 
//But for multiples of three print “Fizz” instead of the number and 
//for the multiples of five print “Buzz”. 
//For numbers which are multiples of both three and five print “FizzBuzz”."

for i in 1...100 {
    if i % 3 == 0 && i % 5 == 0 {
        println("FizzBuzz")
    } else if i % 3 == 0 {
        println("Fizz")
    } else if i % 5 == 0 {
        println("Buzz")
    } else {
        println(i)
    }
}


//sexier way to do this
for i in 1...100 {
    var toPrint = ""
    if i % 3 == 0 {
        toPrint += "Fizz"
    }
    if i % 5 == 0 {
        toPrint += "Buzz"
    }
    if toPrint.isEmpty {
        toPrint = String(i)
    }
    println(toPrint)
}


//or even
for i in 1...100 {
    var toPrint = ""
    i % 3 == 0 ? toPrint.join(["Fizz"]) : ""
    i % 5 == 0 ? toPrint.join(["Buzz"]) : ""
    if toPrint.isEmpty {
        toPrint = String(i)
    }
    println(toPrint)
}
