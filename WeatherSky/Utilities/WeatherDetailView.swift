//
//  WeatherDetailView.swift
//  WeatherSky
//
//  Created by Aysema Çam on 18.07.2024.
//

import SwiftUI

struct WeatherDetailView: View {
    var weather: WeatherResponse?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Weather Details")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "humidity")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        VStack(alignment: .leading) {
                            Text("Humidity")
                                .font(.subheadline)
                                .foregroundColor(.white)
                            Text("\(weather?.main.humidity ?? 0)%")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                    }
                    
                    HStack {
                        Image(systemName: "barometer")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        VStack(alignment: .leading) {
                            Text("Pressure")
                                .font(.subheadline)
                                .foregroundColor(.white)
                            Text("\(weather?.main.pressure ?? 0) hPa")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                    }
                }
                Spacer()
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "wind")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        VStack(alignment: .leading) {
                            Text("Wind Speed")
                                .font(.subheadline)
                                .foregroundColor(.white)
                            Text("\(weather?.wind.speed ?? 0, specifier: "%.1f") km/h")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                    }
                    
                    HStack {
                        Image(systemName: "cloud.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        VStack(alignment: .leading) {
                            Text("Cloudiness")
                                .font(.subheadline)
                                .foregroundColor(.white)
                            Text("\(weather?.clouds.all ?? 0)%")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            
          
        }
        .padding()
     
        .background(Color.red.opacity(0.2))
        .cornerRadius(10)
    }
    
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(weather: WeatherResponse(
            coord: Coord(lon: 0, lat: 0),
            weather: [Weather(id: 0, main: "Sunny", description: "Clear sky", icon: "01d")],
            base: "stations",
            main: Mainn(temp: 25.0, feels_like: 25.0, temp_min: 20.0, temp_max: 30.0, pressure: 1015, humidity: 60, sea_level: nil, grnd_level: nil),
            visibility: 10000,
            wind: Wind(speed: 5.5, deg: 150),
            clouds: Clouds(all: 20),
            dt: 0,
            sys: Sys(type: 0, id: 0, country: "Country", sunrise: 0, sunset: 0),
            timezone: 0,
            id: 0,
            name: "City",
            cod: 0))
    }
}
