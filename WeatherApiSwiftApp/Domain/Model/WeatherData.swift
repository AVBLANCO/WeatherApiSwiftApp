//
//  WeatherData.swift
//  WeatherApiSwiftApp
//
//  Created by Victor Manuel Blanco Mancera on 4/09/24.
//

import Foundation
import CoreLocation

struct WeatherData: Codable {
    var coord: Coord
    struct Coord: Codable {
        var lon: Double
        var lat: Double
    }
}
