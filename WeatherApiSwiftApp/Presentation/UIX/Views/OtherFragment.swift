//
//  OtherFragment.swift
//  WeatherApiSwiftApp
//
//  Created by Victor Manuel Blanco Mancera on 4/09/24.
//

import SwiftUI
import MapKit

struct OtherFragment: View {
    @ObservedObject var viewModel: OtherFragmentViewModel

    var body: some View {
        List(viewModel.history, id: \.coord.lat) { data in
            Text("Lat: \(data.coord.lat), Lon: \(data.coord.lon)")
        }
    }
}
