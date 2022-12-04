//
//  Constants.swift
//  Weather MVVM
//
//  Created by Abduqodir's MacPro on 2022/10/20.
//

import Foundation


struct Constants {
  struct Urls {
    
    static func urlForWeatherCity(city: String) -> URL {
      
      let userDefaults = UserDefaults.standard
      let unit = (userDefaults.value(forKey: "unit") as? String) ?? "metric"
      
      return URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=4a9582814fd66eb61d220868ae02aaa0&units=\(unit)&q=\(city.escaped())")!
    }
    
  }
}
