//
//  WeatherListTableViewController.swift
//  Weather MVVM
//
//  Created by Abduqodir's MacPro on 2022/10/14.
//

import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate {
  
  private var weatherListViewModel = WeatherListViewModel()
  private var lastSelectedUnit: Unit!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.prefersLargeTitles = true
    
    let userDefaults = UserDefaults.standard
    if let value = userDefaults.value(forKey: "unit") as? String {
      self.lastSelectedUnit = Unit(rawValue: value)!
    }
  }
  
  func addWeatherDidSave(vm: WeatherViewModel) {
    weatherListViewModel.addWeatherViewModel(vm)
    self.tableView.reloadData()
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return weatherListViewModel.numberOfRows(section)
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
    
    let weatherVM = weatherListViewModel.modelAt(indexPath.row)
    cell.configure(weatherVM)
    return cell
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "AddCityVC" {
      prepareSegueForAddCityVC(segue: segue)
    } else if segue.identifier == "SettingsVC" {
      prepareSegueForSettingsVC(segue: segue)
    }
  }
  
  func prepareSegueForSettingsVC(segue: UIStoryboardSegue) {
    
    guard let nav = segue.destination as? UINavigationController else {
      fatalError("Navigation Controller Not Found!")
    }
    
    guard let settingsVC = nav.viewControllers.first as? SettingTableViewController else {
      fatalError("AddCityViewController not found")
    }
    
    settingsVC.delegate = self
    
  }
  
  
  func prepareSegueForAddCityVC(segue: UIStoryboardSegue) {
    
    guard let nav = segue.destination as? UINavigationController else {
      fatalError("Navigation Controller Not Found!")
    }
    
    guard let addCityVC = nav.viewControllers.first as? AddCityViewController else {
      fatalError("AddCityViewController not found")
    }
    
    addCityVC.delegate = self
    
  }
  
}


extension WeatherListTableViewController: SettingsDelegate {
  
  func settingsDone(vm: SettingsViewModel) {
    if lastSelectedUnit.rawValue != vm.selectedUnit.rawValue {
      weatherListViewModel.updateUnit(to: vm.selectedUnit)
      tableView.reloadData()
      lastSelectedUnit = Unit(rawValue: vm.selectedUnit.rawValue)
    }
  }
  
}
