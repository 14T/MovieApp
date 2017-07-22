//
//  UIViewExtension.swift
//  StoryApp
//
//  Created by Chetan Anand on 23/5/17.
//  Copyright © 2017 Chetan Anand. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  
  func clipToRoundedCorner() {
    self.layoutIfNeeded()
    self.layer.cornerRadius = self.bounds.height/2
    self.clipsToBounds = true
  }
  
}
