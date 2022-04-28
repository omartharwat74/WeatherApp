//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Omar Tharwat on 4/26/22.
//  Copyright © 2022 Omar Tharwat. All rights reserved.
//

import Foundation


struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}


     struct Main: Codable {
             let temp: Double
}


struct Weather: Codable {
    let description: String
    let id: Int
}
