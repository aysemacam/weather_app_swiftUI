//
//  DailyForecastView.swift
//  WeatherSky
//
//  Created by Aysema Çam on 18.07.2024.
//

import SwiftUI

struct DailyForecast: Identifiable {
    let id = UUID()
    let title: String
    let date: String
    let leftImageName: String
    let middleText: String
    let rightImageName: String
    let anotherTitle: String
    let buttonImageName: String
    let color: Color
}

struct DailyTopView: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.white)
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
        }
        .padding()
        .background(Color.clear.opacity(0.2))
        .cornerRadius(10, corners: [.topLeft, .topRight])
    }
}

struct DailyForecastView: View {
    let forecasts: [DailyForecast]
    
    var body: some View {
        VStack(spacing: 0) {
            DailyTopView(icon: "cloud.sun.fill", title: "Weekly Forecast")
                .cornerRadius(10, corners: [.topLeft, .topRight])
            
            List(forecasts) { forecast in
                HStack {
                    VStack(alignment: .leading) {
                        Text(forecast.title)
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(forecast.date)
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Image(systemName: forecast.leftImageName)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(forecast.color)
                    
                    Text(forecast.middleText)
                        .padding(.horizontal, 8)
                        .foregroundColor(.white)
                    
                    Image(systemName: forecast.rightImageName)
                        .resizable()
                        .frame(width: 20, height: 15)
                        .foregroundColor(.red.opacity(0.4))
                    
                    Text(forecast.anotherTitle)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        // Button action
                    }) {
                        Image(systemName: forecast.buttonImageName)
                            .foregroundColor(.white)
                    }
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear.opacity(0.2))
            }
            .listStyle(PlainListStyle())
            .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
        }
        .background(Color.red.opacity(0.2))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct DailyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastView(forecasts: [
            DailyForecast(title: "Today", date: "7/24", leftImageName: "cloud.rain", middleText: "26", rightImageName: "sparkle", anotherTitle: "34", buttonImageName: "chevron.down", color: .blue),
            DailyForecast(title: "Sunday", date: "7/25", leftImageName: "cloud.rain", middleText: "25", rightImageName: "sparkle", anotherTitle: "32", buttonImageName: "chevron.down", color: .blue),
            
            DailyForecast(title: "Monday", date: "7/25", leftImageName: "sun.min.fill", middleText: "25", rightImageName: "sparkle", anotherTitle: "32", buttonImageName: "chevron.down", color: .yellow),
            DailyForecast(title: "Tuesday", date: "7/25", leftImageName: "sun.max.fill", middleText: "24", rightImageName: "sparkle", anotherTitle: "32", buttonImageName: "chevron.down", color: .yellow),
            DailyForecast(title: "Wednesday", date: "7/25", leftImageName: "sun.max.fill", middleText: "24", rightImageName: "sparkle", anotherTitle: "32", buttonImageName: "chevron.down", color: .yellow),
            DailyForecast(title: "Thursday", date: "7/25", leftImageName: "sun.max.fill", middleText: "24", rightImageName: "sparkle", anotherTitle: "30", buttonImageName: "chevron.down", color: .yellow),
            DailyForecast(title: "Friday", date: "7/25", leftImageName: "cloud.rain", middleText: "23", rightImageName: "sparkle", anotherTitle: "30", buttonImageName: "chevron.down", color: .blue),
            DailyForecast(title: "Saturday", date: "7/25", leftImageName: "sun.max.fill", middleText: "23", rightImageName: "sparkle", anotherTitle: "29", buttonImageName: "chevron.down", color: .yellow),
            DailyForecast(title: "Sunday", date: "7/25", leftImageName: "cloud.rain", middleText: "22", rightImageName: "sparkle", anotherTitle: "28", buttonImageName: "chevron.down", color: .blue),
            DailyForecast(title: "Monday", date: "7/25", leftImageName: "cloud.rain", middleText: "20", rightImageName: "sparkle", anotherTitle: "28", buttonImageName: "chevron.down", color: .blue)
        ])
    }
}
