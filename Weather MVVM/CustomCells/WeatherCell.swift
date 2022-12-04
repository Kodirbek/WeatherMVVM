//
//  WeatherCell.swift
//  Weather MVVM
//
//  Created by Abduqodir's MacPro on 2022/10/18.
//

import UIKit

class WeatherCell: UITableViewCell {
  
  @IBOutlet weak var cityName: UILabel!
  @IBOutlet weak var temperature: UILabel!
  
  func configure(_ vm: WeatherViewModel) {
    self.cityName.text = vm.city
    self.temperature.text = "\(vm.temperature.formatAsDegree())"
  }
  
}
