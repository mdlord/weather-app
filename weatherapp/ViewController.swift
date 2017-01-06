//
//  ViewController.swift
//  weatherapp
//
//  Created by Mayank Daswani on 1/5/17.
//  Copyright © 2017 Mayank Daswani. All rights reserved.
//

import UIKit
import Foundation
import MapKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var cityName: UITextField!
    @IBOutlet weak var cityTemp: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBAction func getData(_ sender: Any) {
        
        weatherData(urlString: String("http://api.openweathermap.org/data/2.5/weather?q="+(cityName.text)!+"uk&APPID=c2c72d0b0034df8d3317873ed16c1c0a"))
    }
    @IBOutlet weak var mymap: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherData(urlString: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=c2c72d0b0034df8d3317873ed16c1c0a")
        let location = CLLocationCoordinate2DMake(-27.4, 153.51)
        
        let mapspan = MKCoordinateSpanMake(0.1, 0.1)
        let mapregion = MKCoordinateRegionMake(location, mapspan)
        
        self.mymap.setRegion(mapregion, animated:true)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func weatherData(urlString: String)
    {
    
                //let urlString = "http://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=c2c72d0b0034df8d3317873ed16c1c0a"
        
                let url = URL(string: urlString)
                URLSession.shared.dataTask(with:url!)
                { (data, response, error) in
                    if error != nil
                    {
                        print(error as Any)
                    }
                    else
                    {
                        do
                        {
        
                            let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
        
                            let currentplace = parsedData["name"] as! String
                            self.cityNameLabel.text = currentplace
                            print(currentplace)
        
                            let currentConditions = parsedData["main"] as! [String:Any]
                            print("yoylol")
        
                            let currentTemperatureF = currentConditions["temp"] as! Double
                            self.cityTemp.text = String(format: "%0.1f", currentTemperatureF)
                            print(currentTemperatureF)
                            
                            let locate = parsedData["coord"] as! [String:Any]
                            print("yoy")
                            
                            let currentlong = locate["lon"] as! Double
                            let longitudemm = currentlong
                            print(longitudemm)

                            let currentlat = locate["lat"] as! Double
                            let latitudemm = currentlat
                            print(latitudemm)
                            
                            let location = CLLocationCoordinate2DMake(latitudemm, longitudemm)
                            
                            let mapspan = MKCoordinateSpanMake(0.1, 0.1)
                            let mapregion = MKCoordinateRegionMake(location, mapspan)
                            
                            self.mymap.setRegion(mapregion, animated:true)

                            
                        }
                        catch let error as NSError
                        {
                            print(error)
                        }
                    }
                    
                }.resume()
    }

}

