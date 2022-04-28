//
//  ViewController.swift
//  WeatherApp
//
//  Created by Omar Tharwat on 4/26/22.
//  Copyright © 2022 Omar Tharwat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var weatherManger = WeatherManger()
    
    // MARK : OUTLETS
    @IBOutlet weak var degreeView: UIView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var mappin: UIImageView!
    @IBOutlet weak var tempretureLabel: UILabel!
    @IBOutlet weak var cLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewsDesign()
        
        
        
    }
   func setViewsDesign(){
       let lineView = UIView(frame: CGRect(x:0, y: self.degreeView.frame.height, width: self.degreeView.frame.width, height: 1) )
       lineView.backgroundColor = UIColor.black
       self.degreeView.addSubview(lineView)
          searchView.layer.cornerRadius = 15
          searchView.layer.shadowColor = UIColor.lightGray.cgColor
          searchView.layer.shadowOpacity = 0.2
          searchView.layer.shadowOffset = .zero
          searchView.layer.shadowRadius = 5
      }
    
    
    // MARK : ACTIONS
    @IBAction func searchButton(_ sender: Any) {
        if searchTextField.text == "" {
            searchTextField.placeholder = "Please type something"
        } else {
            if let city = searchTextField.text {
             let url = weatherManger.fitchWeather(cityName: city)
                weatherManger.getData(url: url) { (WeatherData) in
                    let weather = WeatherModel(conditionId: WeatherData.weather[0].id, cityName: WeatherData.name, temperature: WeatherData.main.temp)
                    let temp = weather.temperatureInt
                    let condition = weather.conditionName
                    let name = weather.cityName
                    self.cityLabel.text = name
                    self.tempretureLabel.text = String(temp)
                    self.conditionImageView.image = UIImage(systemName: condition)
                    
                    
                }
                
            }

        }
    }
    

}

