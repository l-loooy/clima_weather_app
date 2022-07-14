//
//  WeatherModel.swift
//  Clima_weather_app
//
//  Created by admin on 12.07.2022.
//  Copyright © 2022 Sergey Lolaev. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.01f", temperature)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200..<300:
            return ("cloud.bolt")
        case 300...321:
            return ("cloud.drizzle")
        case 500..<600:
            return ("cloud.rain")
        case 600..<700:
            return ("cloud.snow")
        case 700..<800:
            return ("cloud.fog")
        case 800:
            return ("sum.max")
        case 801...804:
            return ("cloud.bolt")
        default:
            return "cloud"
        }
    }
}
