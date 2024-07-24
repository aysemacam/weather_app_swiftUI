//
//  ApiServices.swift
//  WeatherSky
//
//  Created by Aysema Çam on 18.07.2024.
//

import Foundation

class ApiServices {
    static let shared = ApiServices()
    func fetchWeather(for city: String, completion: @escaping (WeatherResponse?) -> Void) {
        let weatherURL = "https://api.openweathermap.org/data/2.5/weather"
        let apiKey = "095b5ee0271d42afbb2bec8e2c9030e3"
        let units = "metric"
        let urlString = "\(weatherURL)?q=\(city)&appid=\(apiKey)&units=\(units)"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                completion(decodedResponse)
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}
