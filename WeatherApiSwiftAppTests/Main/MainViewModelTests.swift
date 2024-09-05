//
//  MainViewModelTests.swift
//  WeatherApiSwiftAppTests
//
//  Created by Victor Manuel Blanco Mancera on 5/09/24.
//

import XCTest
@testable import WeatherApiSwiftApp

class AppCoordinatorTests: XCTestCase {

    var coordinator: AppCoordinator!

    override func setUp() {
        super.setUp()
        coordinator = AppCoordinator()
    }

    override func tearDown() {
        coordinator = nil
        super.tearDown()
    }

    func testShowContentView() {
        coordinator.showContentView()
        XCTAssertTrue(coordinator.currentView is AnyView<ContentView>)
    }

    func testShowMainView() {
        coordinator.showMainView()
        XCTAssertTrue(coordinator.currentView is AnyView<MainView>)
    }

    func testShowMapView() {
        let coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        coordinator.showMapView(with: coordinate)
        XCTAssertTrue(coordinator.currentView is AnyView<MapViews>)
    }

    func testShowOtherFragment() {
        coordinator.showOtherFragment()
        XCTAssertTrue(coordinator.currentView is AnyView<OtherFragment>)
    }
}

