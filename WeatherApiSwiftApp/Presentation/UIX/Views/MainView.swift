//
//  MainView.swift
//  WeatherApiSwiftApp
//
//  Created by Victor Manuel Blanco Mancera on 4/09/24.
//

import SwiftUI
import MapKit

struct MainView: View {
    //@StateObject private var viewModel = MainViewModel()
    var coordinator: AppCoordinator
    @StateObject private var viewModel = MainViewModel()

    var body: some View {
        VStack {
            Button("Show Map View") {
                viewModel.showMapView = true
            }
            .sheet(isPresented: $viewModel.showMapView) {
                if let coord = viewModel.weatherData?.coord {
                    MapViews(viewModel: MapViewModel(coordinate: CLLocationCoordinate2D(latitude: coord.lat, longitude: coord.lon)))
                }
            }

            Button("Show Other Fragment") {
                coordinator.showOtherFragment()
            }

            Button("Fetch Weather Data") {
                viewModel.fetchWeatherData()
            }
        }
    }
}
