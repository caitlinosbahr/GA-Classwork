import Foundation

class ForecastItem {
    let date: String?
    let temp: Double?
    let desc: String?
    let iconId: String?
    
    var iconURL : String {
        get {
            return "http://openweathermap.org/img/w/\(iconId!).png"
        }
    }
    
    var formattedTemp : String {
        let formatter = NSNumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        
        return "\(formatter.stringFromNumber(temp as! NSNumber)!)℉"
        
    }
    
    init(date: String, temp: Double, desc: String, iconId: String) {
        self.date = date
        self.temp = 9/5 * (temp - 273) + 32 //convert kelvin to farenheit
        self.desc = desc
        self.iconId = iconId
    }
}