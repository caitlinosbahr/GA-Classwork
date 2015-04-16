//
//  Forecast.swift
//  Forecast2
//
//  Created by Caitlin Osbahr on 4/15/15.
//  Copyright (c) 2015 Caitlin Osbahr. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Forecast {
    var location: String?
    var forecastItems: [ForecastItem]?
    
    init(location: String?, items: [ForecastItem]){
        self.location = location
        self.forecastItems = items
    }
    
    class func retrieveForecastByCity(query: String, completionHandler: ((Forecast) -> Void)) {
        Alamofire.request(Method.GET, "http://api.openweathermap.org/data/2.5/forecast", parameters: ["q" : query])
            .response { (request, response, data, error) -> Void in
                let json = JSON(data: data as! NSData)
                
                var forecastItems = [ForecastItem]()
                
                //for loop creates individual objects for each thing we get back and adds it to an array
                for (index: String, item: JSON) in json["list"] {
                    var forecastItem = ForecastItem(date: item["dt_txt"].stringValue, temp: item["main"]["temp"].doubleValue, desc: item["weather"][0]["description"].stringValue, iconId: item["weather"][0]["icon"].stringValue)
                    forecastItems.append(forecastItem)
                }
                
                let forecast = Forecast(location: json["city"]["name"].stringValue, items: forecastItems)
                completionHandler(forecast)
        
        }
    
    }
}
