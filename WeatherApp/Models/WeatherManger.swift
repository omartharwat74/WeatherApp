//
//  WheatherManger.swift
//  WeatherApp
//
//  Created by Omar Tharwat on 4/26/22.
//  Copyright © 2022 Omar Tharwat. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
 struct WeatherManger {
     let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=4e743b94569f8af638b6bf12ea03d5b0&q="
    
    func fitchWeather(cityName : String) -> String  {
        let urlweather = "\(weatherUrl)\(cityName)"
        return urlweather
    }
    func getData(url:String ,  completionHandler : @escaping (WeatherData) -> ()){
        AF.request(url).responseJSON { (response) in
            let jsonData = JSON(response.value)
            let decoder = JSONDecoder()
            do{
                let data = try decoder.decode(WeatherData.self, from: jsonData.rawData())
                print(data)
                completionHandler(data)
            } catch let error {
                print(error)
            }
            
            
        }
        
    }
}

