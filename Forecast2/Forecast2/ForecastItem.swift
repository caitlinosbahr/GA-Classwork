//
//  ForecastItem.swift
//  Forecast2
//
//  Created by Caitlin Osbahr on 4/15/15.
//  Copyright (c) 2015 Caitlin Osbahr. All rights reserved.
//

import Foundation

class ForecastItem {
    let date : String?
    let temp: Double?
    let desc: String?
    let iconId: String?
    
    init(date: String, temp: Double, desc: String, iconId: String) {
        self.date = date
        self.temp = 9/5 * (temp - 273) + 32 // kelvin -> fahrenheit
        self.desc = desc
        self.iconId = iconId
    }
    
}