//
//  HorizontalHourlyForecast.swift
//  WeatherSky
//
//  Created by Aysema Çam on 18.07.2024.
//

import SwiftUI

struct HorizontalHourlyForecastView: View {
    var body: some View {
        VStack(spacing: 0) {
            TopView()
                .background(Color.red.opacity(0.2))
                .cornerRadius(10, corners: [.topLeft, .topRight])
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 63)
            ScrollView(.horizontal, showsIndicators: false) {
                VStack(spacing: 0) {
                    HStack(spacing: 10) {
                        HorizontalHourlyForecast(time: "1", icon: "moon.fill", temperature: 25)
                        HorizontalHourlyForecast(time: "2", icon: "moon.fill", temperature: 26)
                        HorizontalHourlyForecast(time: "3", icon: "moon.fill", temperature: 27)
                        HorizontalHourlyForecast(time: "4", icon: "moon.fill", temperature: 28)
                        HorizontalHourlyForecast(time: "5", icon: "moon.fill", temperature: 29)
                        HorizontalHourlyForecast(time: "6", icon: "moon.fill", temperature: 30)
                        HorizontalHourlyForecast(time: "7", icon: "moon.fill", temperature: 30)
                        HorizontalHourlyForecast(time: "8", icon: "moon.fill", temperature: 30)
                        HorizontalHourlyForecast(time: "9", icon: "moon.fill", temperature: 29)
                        HorizontalHourlyForecast(time: "10", icon: "moon.fill", temperature: 28)
                        HorizontalHourlyForecast(time: "11", icon: "moon.fill", temperature: 27)
                        HorizontalHourlyForecast(time: "12", icon: "moon.fill", temperature: 26)
                        HorizontalHourlyForecast(time: "13", icon: "moon.fill", temperature: 25)
                        HorizontalHourlyForecast(time: "14", icon: "moon.fill", temperature: 27)
                        HorizontalHourlyForecast(time: "15", icon: "moon.fill", temperature: 27)
                        HorizontalHourlyForecast(time: "16", icon: "moon.fill", temperature: 28)
                        HorizontalHourlyForecast(time: "17", icon: "moon.fill", temperature: 29)
                        HorizontalHourlyForecast(time: "18", icon: "moon.fill", temperature: 30)
                        HorizontalHourlyForecast(time: "19", icon: "moon.fill", temperature: 32)
                        HorizontalHourlyForecast(time: "20", icon: "moon.fill", temperature: 27)
                        HorizontalHourlyForecast(time: "21", icon: "moon.fill", temperature: 27)
                        HorizontalHourlyForecast(time: "22", icon: "moon.fill", temperature: 27)
                        HorizontalHourlyForecast(time: "23", icon: "cloud.fill", temperature: 25)
                        HorizontalHourlyForecast(time: "00", icon: "sun.max.fill", temperature: 24)
                    }
                    GradientView(temperatures: [25, 26, 27, 28, 29, 30, 30, 30, 29, 28, 27, 26, 25, 27, 27, 28, 29, 30, 32, 27, 27, 27, 25, 24])
                        .frame(height: 3)
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.9, height: 100)
            .background(Color.red.opacity(0.2))
            .padding(.horizontal, 20)
        }
    }
}

struct GradientView: View {
    var temperatures: [Int]
    
    var body: some View {
        let gradientColors = temperatures.map { temperatureColor(temperature: $0) }
        
        LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .leading, endPoint: .trailing)
            .mask(Rectangle())
    }
    
    func temperatureColor(temperature: Int) -> Color {
        let minTemp = 24
        let maxTemp = 32
        let tempRatio = CGFloat((temperature - minTemp)) / CGFloat(maxTemp - minTemp)
        
        let red = tempRatio
        let green = 1.2 * (1.0 - tempRatio)
        let blue = 0.0
        
        return Color(red: Double(red), green: Double(green), blue: Double(blue))
    }
}

struct TopView: View {
    @State private var isSwitchOn = false
    
    var body: some View {
        HStack {
            Image(systemName: "clock.fill")
                .foregroundColor(.white)
            
            Text("Hourly Forecast")
                .foregroundColor(.white)
                .font(.headline)
            
            Spacer()
            
            Text("Vertical")
                .foregroundColor(.white)
            
            Toggle(isOn: $isSwitchOn) {
                Text("")
            }
            .labelsHidden()
            .toggleStyle(SwitchToggleStyle(tint: .white))
        }
        .padding()
    }
}

struct HorizontalHourlyForecast: View {
    var time: String
    var icon: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Text(time)
                .foregroundColor(.white)
            Image(systemName: icon)
                .foregroundColor(.white)
            Spacer()
            Text("\(temperature)°")
                .foregroundColor(.white)
        }
        .frame(width: 30, height: 100)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    HorizontalHourlyForecastView()
}
