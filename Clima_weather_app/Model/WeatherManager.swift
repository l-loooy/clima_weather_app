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
        let urlString = "\(weatherURl)&q=\(cityName.localizedCapitalized)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.pasrseJSON(weatherData: safeData)
                }
            }
            
            task.resume()
        }
    }
    
    func pasrseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather[0].description)
        }
        catch {
            print(error)
        }
    
    }
}
