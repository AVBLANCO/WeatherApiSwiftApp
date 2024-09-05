//
//  AppCoordinator.swift
//  WeatherApiSwiftApp
//
//  Created by Victor Manuel Blanco Mancera on 4/09/24.
//

import Foundation
import SwiftUI
import CoreLocation

class AppCoordinator: ObservableObject {
    @Published var currentView: AnyView?

    init() {
        showContentView()
    }

    func showContentView() {
        currentView = AnyView(ContentView(coordinator: self))
    }

    func showMainView() {
        currentView = AnyView(MainView(coordinator: self))
    }

    func showMapView(with coordinate: CLLocationCoordinate2D) {
        currentView = AnyView(MapViews(viewModel: MapViewModel(coordinate: coordinate)))
    }

    func showOtherFragment() {
        currentView = AnyView(OtherFragment(viewModel: OtherFragmentViewModel()))
    }
}
