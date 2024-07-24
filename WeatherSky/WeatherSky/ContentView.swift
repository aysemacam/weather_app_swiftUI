//
//  ContentView.swift
//  WeatherSky
//
//  Created by Aysema Çam on 18.07.2024.
//

import Combine
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()

    var body: some View {
        ScrollView {
            VStack {
                WeatherTopPart(searchText: $viewModel.searchText)
                    .frame(width: UIScreen.main.bounds.width)
                WeatherSecondView(weather: viewModel.weather)
                    .frame(width: UIScreen.main.bounds.width)
                WeatherSkyThirdView(weather: viewModel.weather)
                    .frame(width: UIScreen.main.bounds.width)
                WeatherDetailView(weather: viewModel.weather)
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                HorizontalHourlyForecastView()
                    .frame(width: UIScreen.main.bounds.width)

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
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.5)
            }
            .padding()
        }
        .background(Color.init(red: 0.263, green: 0.118, blue: 0.565))
        .onAppear {
            viewModel.fetchWeather(for: "Istanbul")
        }
        .navigationBarHidden(true)
        .hideKeyboardOnTap()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

class WeatherViewModel: ObservableObject {
    @Published var weather: WeatherResponse?
    @Published var searchText = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $searchText
            .debounce(for: .seconds(0.3), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [unowned self] searchText in
                guard !searchText.isEmpty else { return }
                self.fetchWeather(for: searchText)
            }
            .store(in: &cancellables)
    }
    
     func fetchWeather(for city: String) {
        ApiServices.shared.fetchWeather(for: city) { response in
            DispatchQueue.main.async {
                self.weather = response
            }
        }
    }
}
import SwiftUI

extension View {
    func hideKeyboardOnTap() -> some View {
        self.onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}
