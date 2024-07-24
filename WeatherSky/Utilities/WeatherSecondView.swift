//
//  WeatherSecondView.swift
//  WeatherSky
//
//  Created by Aysema Çam on 18.07.2024.
//

import SwiftUI

struct WeatherSecondView: View {
    var weather: WeatherResponse?

    var body: some View {
        VStack {
            Text(weather?.name ?? "City")
                .font(.title)
                .padding(.top, 20)
                .foregroundColor(.white)
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "sun.max.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.yellow)
                    Text(weather?.weather.first?.main ?? "Weather")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                     
                }
                
            }
            
            VStack(alignment: .leading) {
                Text("Feels like \(weather?.main.feels_like ?? 0, specifier: "%.1f")°C")
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.medium)
                
            }
            .padding(.top, 2)
            
            HStack {
                Text("Humidity: \(weather?.main.humidity ?? 0)%")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Wind: \(weather?.wind.speed ?? 0, specifier: "%.1f") km/h")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
         
        
        }
    }
}

struct WeatherSecondView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherSecondView(weather: WeatherResponse(
            coord: Coord(lon: 0, lat: 0),
            weather: [Weather(id: 0, main: "Sunny", description: "Clear sky", icon: "01d")],
            base: "stations",
            main: Mainn(temp: 0, feels_like: 0, temp_min: 0, temp_max: 0, pressure: 0, humidity: 0, sea_level: nil, grnd_level: nil),
            visibility: 0,
            wind: Wind(speed: 0, deg: 0),
            clouds: Clouds(all: 0),
            dt: 0,
            sys: Sys(type: 0, id: 0, country: "Country", sunrise: 0, sunset: 0),
            timezone: 0,
            id: 0,
            name: "City",
            cod: 0))
    }
}
