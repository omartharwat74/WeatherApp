//
//  API.swift
//  WeatherApp
//
//  Created by Omar Tharwat on 4/26/22.
//  Copyright © 2022 Omar Tharwat. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class API : WheatherManger {
    static func fetchWheather (cityName:String)  {
        let url = "\(weatherUrl)\(cityName)&appid=\(appId)"
      performRequest(with: url)

    }
    func performRequest(with url : String)  {
        
    }
}
