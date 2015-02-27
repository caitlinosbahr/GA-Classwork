// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let cities = ["New York", "DC", "London"]
cities.first
cities[0]

for city in cities {
    println("hello \(city)")
}



var citiesAndAirportCodes = ["JFK" : "New York", "BWI" : "DC", "LHR" : "London"]
citiesAndAirportCodes ["LHR"]

for (code, city) in citiesAndAirportCodes {
    println("\(code) is the airport code for \(city)")
}

citiesAndAirportCodes.values.array
citiesAndAirportCodes.keys.array

citiesAndAirportCodes["LHR"] = "London Heathrow"
citiesAndAirportCodes["LGW"] = "London Gatwick"
citiesAndAirportCodes["EWR"] = ""


citiesAndAirportCodes

citiesAndAirportCodes.removeValueForKey("LGW")

citiesAndAirportCodes["LGA"]
citiesAndAirportCodes["EWR"]

let city = citiesAndAirportCodes["LGA"]

if city == nil {
    println("doesn't exist")
}

citiesAndAirportCodes ["EWR"]

// get state by abbrev or show idk

func getStateByAbbrev (abbrev: String) -> String {
    let statesAndAbbrev = ["MA" : "Massachussetts" , "ME" : "Maine", "NY" : "New York" , "PA" : "Pennsylvania" , "NJ" : "New Jersey"]
    
    let state = statesAndAbbrev[abbrev]
    if state == nil {
        return "IDK"
    } else {
        return state!
    }
}

getStateByAbbrev("PA")
getStateByAbbrev("NJ")



enum CompassPoint {
    case North
    case West
    case East
    case South
}

let myHeading = CompassPoint.East
var windDirection : CompassPoint = CompassPoint.North

let drivingDirection = "West"
let correctDrivingDirection = CompassPoint.West

if drivingDirection == "West" {

}

if correctDrivingDirection == CompassPoint.West {
}

windDirection
windDirection = CompassPoint.South
windDirection = .South

switch windDirection {
case .East:
    println("blowning eastward")
case .West:
    println("westerly winds")
default:
    println("windy")
}




/* write an enum that holds month of year and write a function that returns the climate for that month */

enum Month {
    case January, February, March, April, June, July, August, September, October, November, December
    
    func getClimateFromMonth() -> String {
        switch self {
        case .January, .February:
            return "cold as fuck"
        case .July, .August:
            return "hot hot hot"
        case .March, .September, .October:
            return "wunderbar"
        default:
            return "it's okay"
        }
    }
}

var january = Month.January
january.getClimateFromMonth()

var august = Month.August
august.getClimateFromMonth()

var othermonth = Month.June
othermonth.getClimateFromMonth()

var spring = Month.March
spring.getClimateFromMonth()




