//
//  OtherFragmentViewModel.swift
//  WeatherApiSwiftApp
//
//  Created by Victor Manuel Blanco Mancera on 4/09/24.
//

import Foundation
import Combine
import CoreLocation

class OtherFragmentViewModel: ObservableObject {
    @Published var history: [WeatherData] = []

    init() {
        loadHistory()
    }

    public func saveData(_ data: WeatherData) {
        var history = UserDefaults.standard.array(forKey: "history") as? [Data] ?? []
        let encodedData = try? JSONEncoder().encode(data)
        if let encodedData = encodedData {
            history.append(encodedData)
            UserDefaults.standard.setValue(history, forKey: "history")
        }
    }

    private func loadHistory() {
        if let historyData = UserDefaults.standard.array(forKey: "history") as? [Data] {
            self.history = historyData.compactMap { try? JSONDecoder().decode(WeatherData.self, from: $0) }
        }
    }
}
