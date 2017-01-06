//
//  ViewController.swift
//  weatherapp
//
//  Created by Mayank Daswani on 1/5/17.
//  Copyright © 2017 Mayank Daswani. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherData(urlString: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=c2c72d0b0034df8d3317873ed16c1c0a")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var cityName: UITextField!
    @IBOutlet weak var cityTemp: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBAction func getData(_ sender: Any) {
    }
    
    func weatherData(urlString: String)
    {
//        let url  = NSURL(string: urlString)
//        let sess = URLSession.shared
//        let task = sess.dataTaskWithURL(url! as URL)
//        {
//            (data, response, error) in
//            dispatch_async(dispatch_get_main_queue(){
//                setLabels(weatherdata:data)})
//        }
//        
                let urlString = "http://api.openweathermap.org/data/2.5/weather?q=\(),uk&APPID=c2c72d0b0034df8d3317873ed16c1c0a"
        
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
        
                            let currentConditions = parsedData["main"] as! [String:Any]
                            print("yoylol")
        
                            let currentTemperatureF = currentConditions["temp"] as! Double
                            self.cityTemp.text = String(format: "%0.1f", currentTemperatureF)
        
                        }
                        catch let error as NSError
                        {
                            print(error)
                        }
                    }
                    
                }.resume()
    }
    
//    func setLabels(weatherdata: NSData )
//    {
//        var jsonerror: NSError?
//        //let data: Data
//        
//        //       let data: Data
//        //let json = try? JSONSerialization.jsonObject(with: weatherdata as Data, options: [])
//        let json = try JSONSerialization.jsonObject(with:weatherdata as Data, options: []) as! [String: AnyObject]
//        
//        
////        if let dictionary = jsonWithObjectRoot as? [String: Any]
////        {
//            if let name  = json["name"] as?String
//            {
//                cityNameLabel.text = name
//            }
//            if let main = json["main"] as?NSDictionary
//            {
//                if let temp = main["temp"] as?Double
//                {
//                    cityTemp.text = String(format: " %.1f", arguments:temp)
//                }
////            }
//                
//                catch error as NSError
//                {
//                    print(error)
//                }
//        }
//    }
//    






}

