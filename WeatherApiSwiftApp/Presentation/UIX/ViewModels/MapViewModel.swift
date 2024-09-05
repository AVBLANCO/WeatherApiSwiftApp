//
//  MapViewModel.swift
//  WeatherApiSwiftApp
//
//  Created by Victor Manuel Blanco Mancera on 4/09/24.
//

import Foundation
import Combine
import CoreLocation
import MapKit

class MapViewModel: ObservableObject {
    @Published var region = MKCoordinateRegion()

    init(coordinate: CLLocationCoordinate2D) {
        self.region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    }

    func focusOnCoordinate() {
        // Aquí puedes agregar lógica adicional si es necesario
    }
}
