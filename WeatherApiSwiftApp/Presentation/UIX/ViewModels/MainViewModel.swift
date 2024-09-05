//
//  MainViewModel.swift
//  WeatherApiSwiftApp
//
//  Created by Victor Manuel Blanco Mancera on 4/09/24.
//

import SwiftUI
import Combine
import CoreLocation

class MainViewModel: ObservableObject {
    @Published var weatherData: WeatherData?
    @Published var showMapView = false
    @Published var showOtherFragment = false

    func fetchWeatherData() {
        let headers = [
            "x-rapidapi-key": "3e04a47360mshe295ad275ed8913p19b181jsn9ee9e64eb55b",
            "x-rapidapi-host": "open-weather13.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://open-weather13.p.rapidapi.com/city/landon/EN")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data received from server")
                return
            }

            // Imprimir el JSON recibido para verificar su estructura
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received JSON: \(jsonString)")
            }

            do {
                // Decodificar los datos recibidos en un objeto WeatherData
                let decodedData = try JSONDecoder().decode(WeatherData.self, from: data)
                DispatchQueue.main.async {
                    self.weatherData = decodedData  // Ajusta esto si tienes una propiedad @Published apropiada
                    UserDefaultsManager.shared.saveWeatherData(decodedData) // Guardar datos en UserDefaults
                }
            } catch {
                print("Failed to decode data: \(error.localizedDescription)")
            }
        })

        dataTask.resume()
    }
}
