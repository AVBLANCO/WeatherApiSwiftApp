//
//  MapViews.swift
//  WeatherApiSwiftApp
//
//  Created by Victor Manuel Blanco Mancera on 4/09/24.
//

import SwiftUI
import MapKit

struct MapViews: View {
    @ObservedObject var viewModel: MapViewModel

    var body: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: viewModel.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))),
            annotationItems: [Pin(coordinate: viewModel.coordinate)]) { pin in
            MapPin(coordinate: pin.coordinate)
        }
    }
}

struct Pin: Identifiable {
    var id = UUID()
    var coordinate: CLLocationCoordinate2D
}
