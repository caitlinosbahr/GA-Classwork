import UIKit
import CoreLocation

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, CLLocationManagerDelegate  {
    @IBOutlet weak var selectedCityField: UITextField!

    @IBOutlet weak var tableView: UITableView!
    
    var forecastItems = [ForecastItem]()
    var locationManager : CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
    }
    
    func searchBarResultsListButtonClicked(searchBar: UISearchBar) {
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let location = locations.last as! CLLocation
        locationManager?.stopUpdatingLocation()
        
        Forecast.retrieveForecastByLocation(location) { (forecastResponse) -> Void in
            self.selectedCityField.text = forecastResponse.location
            self.forecastItems = forecastResponse.forecastItems!
            self.tableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        Forecast.retrieveForecastByCity(searchBar.text, completionHandler: { (forecastResponse) -> Void in
            self.selectedCityField.text = forecastResponse.location
            self.forecastItems = forecastResponse.forecastItems!
            self.tableView.reloadData()
        })
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("weatherCell") as! WeatherCell
        
        let forecastItem = forecastItems[indexPath.row]
        cell.textLabel?.text = forecastItem.desc
        cell.detailTextLabel?.text = forecastItem.date
        
        
        let request = NSURLRequest(URL: NSURL(string: forecastItem.iconURL)!)
        
        cell.imageView?.image = nil
        cell.imageView?.cancelImageRequestOperation()
        
        cell.imageView?.setImageWithURLRequest(request, placeholderImage: nil, success: { [weak cell] (request, response, image) -> Void in
            cell!.imageView!.image = image
            cell!.setNeedsLayout()
            }, failure: nil)
        
        cell.tempField.text = forecastItem.formattedTemp
        
        return cell
    }
    
}

