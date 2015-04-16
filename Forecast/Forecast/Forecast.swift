import Foundation
import Alamofire
import SwiftyJSON
import CoreLocation

class Forecast {
    var location: String?
    var forecastItems: [ForecastItem]?
    
    init(location: String?, items: [ForecastItem]){
        self.location = location
        self.forecastItems = items
    }
    
    class func retrieveForecastByCity(query: String, completionHandler: ((Forecast) -> Void)) {
        Forecast.retrieveForecastWithParameters(["q" : query], completionHandler: completionHandler)
    }
    
    class func retrieveForecastByLocation(location: CLLocation, completionHandler: ((Forecast) -> Void)) {
        Forecast.retrieveForecastWithParameters(["lat" : location.coordinate.latitude.description, "lon" : location.coordinate.longitude.description], completionHandler: completionHandler)
    }
    
    class func retrieveForecastWithParameters(params : [String: String], completionHandler : ((Forecast) -> Void)) {
        Alamofire.request(.GET, "http://api.openweathermap.org/data/2.5/forecast", parameters: params)
            .response { (request, response, data, error) -> Void in
                let json = JSON(data: data as! NSData)
                
                var forecastItems = [ForecastItem]()
                
                for (index: String, item: JSON) in json["list"] {
                    var forecastItem = ForecastItem(date: item["dt_txt"].stringValue, temp: item["main"]["temp"].doubleValue, desc: item["weather"][0]["description"].stringValue, iconId: item["weather"][0]["icon"].stringValue)
                    forecastItems.append(forecastItem)
                }
                
                let forecast = Forecast(location: json["city"]["name"].stringValue, items: forecastItems)
                completionHandler(forecast)
        }
    }
}