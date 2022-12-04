//
//  String+Extensions.swift
//  Weather MVVM
//
//  Created by Abduqodir's MacPro on 2022/10/20.
//

import Foundation


extension String {
  func escaped() -> String {
    return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
  }
}
