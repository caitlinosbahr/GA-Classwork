// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var cities = ["New York", "DC", "London"]

cities[1]

//cities[9]

for city in cities {
    println("hello \(city)")
    
}


var citiesAndAirportCodes = ["JFK" : "New York", "BWI" : "DC", "LHR" : "London"]

citiesAndAirportCodes["LHR"]

for (code, city) in citiesAndAirportCodes {
    println("\(code) is the airport code for \(city)")
}

citiesAndAirportCodes.values.array
citiesAndAirportCodes.keys.array

citiesAndAirportCodes["LHR"] = "London Heathrow"
citiesAndAirportCodes["LGW"] = "London Gatwick"

citiesAndAirportCodes["EWR"] = ""

citiesAndAirportCodes.removeValueForKey("LGW")

let city = citiesAndAirportCodes["LGA"]

if city == nil {
    println("doesn't exist")
}
citiesAndAirportCodes["EWR"]




/* write a simple function that returns the name of the state
when the two letter abbrv is passed. 
pick 5 east coast states
if the state is not known, return "Unknown"*/


func getStateNameByAbbrev(abbrev: String) -> String {
    let statesAndAbbrev = ["NY" : "New York", "RI" : "Rhode Island"]
    
    let state = statesAndAbbrev[abbrev]
    if state == nil {
        return "Unknown"
    } else {
        return state!
    }
}

getStateNameByAbbrev("CT")
getStateNameByAbbrev("RI")

/*
Int
String
Double
UIColor
...
*/

enum CompassPoint {
    case North
    case West
    case East
    case South
    
    func getDescriptiveWindDirection() -> String {
        switch self {
        case .East:
            return "blowing eastward"
        case .West:
            return "blowing towards the west"
        default:
            return "its blowing some other way"
        }
    }
}

let myHeading = CompassPoint.East

myHeading.getDescriptiveWindDirection()

var windDirection : CompassPoint = CompassPoint.North

let drivingDirection = "west"
let correctDrivingDirection = CompassPoint.West

if drivingDirection == "West" {
    
}

if correctDrivingDirection == CompassPoint.West {
    
}

windDirection
windDirection = CompassPoint.South
windDirection = .North


/* write an enum that hold month of the year
and write a function that return the climate for that month */

var months = ["Jan" : "Cold", "Feb": "Cold"]

enum Month {
    case Jan, Feb, Mar, April, May, June
    
    func getClimate() -> String {
        switch self {
        case .Jan, .Feb, .Mar, .April:
            return "its cold"
        case .May, .June:
            return "its better"
        }
    }
    
    func getNextMonth() -> Month {
        return Month.Feb
    }
}

var jan = Month.Jan
jan.getClimate()
jan.getNextMonth()




























