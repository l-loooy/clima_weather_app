//
//  WeatherData.swift
//  Clima_weather_app
//
//  Created by admin on 12.07.2022.
//  Copyright © 2022 Sergey Lolaev. All rights reserved.
//

import Foundation


struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
    
}

struct Weather: Decodable {
    let description: String
}
