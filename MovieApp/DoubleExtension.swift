//
//  DoubleExtension.swift
//  MovieApp
//
//  Created by Chetan Anand on 23/7/17.
//  Copyright © 2017 ChetanAnand. All rights reserved.
//

import Foundation

extension Double {
  /// Rounds the double to decimal places value
  func roundTo(places:Int) -> Double {
    let divisor = pow(10.0, Double(places))
    return (self * divisor).rounded() / divisor
  }
}
