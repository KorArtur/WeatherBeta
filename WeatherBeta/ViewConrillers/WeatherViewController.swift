//
//  WeatherViewController.swift
//  WeatherBeta
//
//  Created by Карина Короткая on 17.03.2024.
//

import UIKit

final class WeatherViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchWeather()
    }
    
    private func fetchWeather() {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Moscow&units=metric&lang=ru&APPID=239984673fcc9cd389be094b9a97cbbc")!
        URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let weather = try JSONDecoder().decode(WeatherData.self, from: data)
                print(weather)
            } catch {
                print(error)
            }
            
        }.resume()
    }
}
