//
//  WeatherResponse.swift
//  Weather MVVM
//
//  Created by Abduqodir's MacPro on 2022/10/20.
//

import Foundation


struct WeatherResponse: Decodable {
  let name: String
  let main: Weather
}

struct Weather: Codable {
  let temp: Double
  let humidity: Double
}
