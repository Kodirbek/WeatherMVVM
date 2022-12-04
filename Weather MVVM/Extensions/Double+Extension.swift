//
//  Double+Extension.swift
//  Weather MVVM
//
//  Created by Abduqodir's MacPro on 2022/10/20.
//

import Foundation

extension Double {
  func formatAsDegree() -> String {
    return String(format: "%.0f", self)
  }
}
