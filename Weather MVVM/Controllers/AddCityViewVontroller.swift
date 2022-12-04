//
//  AddCityViewVontroller.swift
//  Weather MVVM
//
//  Created by Abduqodir's MacPro on 2022/10/14.
//

import UIKit

protocol AddWeatherDelegate {
  func addWeatherDidSave(vm: WeatherViewModel)
}


class AddCityViewController: UIViewController {
  
  @IBOutlet weak var cityNameTextField: UITextField!
  private var addWeatherVM = AddWeatherViewModel()
  var delegate: AddWeatherDelegate?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  
  @IBAction func saveCityButtonPressed() {
    if let city = cityNameTextField.text {
      addWeatherVM.addWeather(for: city) { vm in
        self.delegate?.addWeatherDidSave(vm: vm)
        self.dismiss(animated: true)
      }
    }
    
  }
  
  
  @IBAction func close() {
    self.dismiss(animated: true)
  }
  
}
