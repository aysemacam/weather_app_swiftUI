//
//  WeatherSkyThirdView.swift
//  WeatherSky
//
//  Created by Aysema Çam on 18.07.2024.
//

import SwiftUI

struct WeatherSkyThirdView: View {
    var weather: WeatherResponse?

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "sunrise.fill")
                        .resizable()
                        .frame(width: 20, height: 18)
                        .padding(.trailing, 0)
                        .foregroundColor(.white)

                    VStack(alignment: .leading) {
                        Text("Sunrise")
                            .font(.system(size: 13, weight: .thin))
                            .foregroundColor(.white)
                        Text(weather != nil ? "\(Date(timeIntervalSince1970: TimeInterval(weather!.sys.sunrise)).formatted(.dateTime.hour().minute()))" : "N/A")
                            .font(.system(size: 13, weight: .regular))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 8, height: 10)
                        .foregroundColor(.white)
                }
                .padding(5)
                .background(Color.red.opacity(0.2))
                .cornerRadius(10)
            }
            .frame(width: 120, height: 40)
            .padding(.trailing, 8)
            
            Spacer()
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "sunset.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing, 0)
                        .foregroundColor(.white)

                    VStack(alignment: .leading) {
                        Text("Sunset")
                            .font(.system(size: 13, weight: .thin))
                            .foregroundColor(.white)
                        Text(weather != nil ? "\(Date(timeIntervalSince1970: TimeInterval(weather!.sys.sunset)).formatted(.dateTime.hour().minute()))" : "N/A")
                            .font(.system(size: 13, weight: .regular))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 8, height: 10)
                        .foregroundColor(.white)
                }
                .padding(5)
                .background(Color.red.opacity(0.2))
                .cornerRadius(10)
            }
            .frame(width: 120, height: 40)
            .padding(.leading, 8)
        }
        .padding(.horizontal)
     
    }
}

#Preview {
    WeatherSkyThirdView(weather: WeatherResponse(
        coord: Coord(lon: 0, lat: 0),
        weather: [Weather(id: 0, main: "Sunny", description: "Clear sky", icon: "01d")],
        base: "stations",
        main: Mainn(temp: 0, feels_like: 0, temp_min: 0, temp_max: 0, pressure: 0, humidity: 0, sea_level: nil, grnd_level: nil),
        visibility: 0,
        wind: Wind(speed: 0, deg: 0),
        clouds: Clouds(all: 0),
        dt: 0,
        sys: Sys(type: 0, id: 0, country: "Country", sunrise: 1689073200, sunset: 1689121200),
        timezone: 0,
        id: 0,
        name: "City",
        cod: 0))
}
