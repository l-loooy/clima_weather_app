//
//  ViewController.swift
//  Clima_weather_app
//
//  Created by admin on 09.07.2022.
//  Copyright © 2022 Sergey Lolaev. All rights reserved.
//


import UIKit

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weaherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}


class WeatherViewController: UIViewController {
   
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    var delegate: WeatherManagerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        weatherManager.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
}

//MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = nil
    }
}


//MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {
    func didFailWithError(error: Error) {
        print(error)
    }
    

    func didUpdateWeather(_ weaherManager: WeatherManager, weather: WeatherModel) {
        print(weather.temperature)
    }
    
}
