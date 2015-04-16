 //
//  ViewController.swift
//  Forecast2
//
//  Created by Caitlin Osbahr on 4/15/15.
//  Copyright (c) 2015 Caitlin Osbahr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource {

    @IBOutlet weak var selectedCityField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var forecastItems = [ForecastItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func searchBarResultsListButtonClicked(searchBar: UISearchBar) {
        //
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
        var cell = tableView.dequeueReusableCellWithIdentifier("weatherCell") as! UITableViewCell
        
        let forecastItem = forecastItems[indexPath.row]
        cell.textLabel?.text = forecastItem.desc
        cell.detailTextLabel?.text = forecastItem.date
        return cell
    }

}

