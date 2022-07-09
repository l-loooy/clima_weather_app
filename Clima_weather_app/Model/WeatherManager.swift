//
//  WeatherModel.swift
//  Clima_weather_app
//
//  Created by admin on 09.07.2022.
//  Copyright © 2022 Sergey Lolaev. All rights reserved.
//

import Foundation


struct WeatherManager {
    let weatherURl = "https://api.openweathermap.org/data/2.5/weather?appid=bf00956c5205bb2797aeb54755ad8914&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURl)&q=\(cityName)"
        print(urlString)
    }
    
}
