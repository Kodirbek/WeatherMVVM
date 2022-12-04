//
//  SettingsViewModelTest.swift
//  Weather MVVMTests
//
//  Created by Abduqodir's MacPro on 2022/11/03.
//

import XCTest
@testable import Weather_MVVM

final class SettingsViewModelTest: XCTestCase {
  
  private var settingsVM: SettingsViewModel!
  
  override func setUp() {
    super.setUp()
    
    self.settingsVM = SettingsViewModel()
  }
  
  func test_defaultUnitIsCelcius() {
    XCTAssertEqual(settingsVM.selectedUnit, .celsius)
  }
  
  func testShouldReturnCorrectDisplayName() {
    XCTAssertEqual(settingsVM.selectedUnit.displayName, "Celsius")
  }
  
  func testShouldConfirmUserDefaults() {
    settingsVM.selectedUnit = .fahrenheit
    let userDefaults = UserDefaults.standard
    XCTAssertEqual(userDefaults.value(forKey: "unit") as! String, "imperial")
  }
  
  override func tearDown() {
    super.tearDown()
    
    let userDefaults = UserDefaults.standard
    userDefaults.removeObject(forKey: "unit")
  }
  
}
