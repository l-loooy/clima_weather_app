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
    
    var delegate: WeatherManagerDelegate?
    
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURl)&q=\(cityName.localizedCapitalized)"
        performRequestWith(urlString)
    }
    
    func performRequestWith(_ urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.pasrseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func pasrseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            print(weather.temperatureString)
            
        }
        catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
        return nil
    }
}
