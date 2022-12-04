//
//  AddWeatherViewModel.swift
//  Weather MVVM
//
//  Created by Abduqodir's MacPro on 2022/10/20.
//

import Foundation


class AddWeatherViewModel {
  
  func addWeather(for city: String, completion: @escaping (WeatherViewModel) -> Void) {
    
    let weatherUrl = Constants.Urls.urlForWeatherCity(city: city)
    
    let weatherResource = Resource<WeatherResponse>(url: weatherUrl) { data in
      
      let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
      return weatherResponse
    }
    
    WebService().load(resource: weatherResource) { (result) in
      if let weatherResource = result {
        let vm = WeatherViewModel(weather: weatherResource)
        completion(vm)
      }
    }
  }
}
