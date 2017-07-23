//
//  NavigationBarConfigurable.swift
//  StoryApp
//
//  Created by Chetan Anand on 23/5/17.
//  Copyright © 2017 Chetan Anand. All rights reserved.
//

import Foundation
import UIKit


protocol NavigationBarConfigurable {
  
  
}


extension NavigationBarConfigurable where Self: UIViewController {
  
  func addTitleButton(selector: Selector) {
    let button =  UIButton(type: .custom)
    button.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
    button.setTitle(self.navigationItem.title, for: .normal)
    button.setTitleColor(UIColor.black, for: UIControlState.normal)
    button.addTarget(self, action: selector, for: .touchUpInside)
    self.navigationItem.titleView = button
  }
  
  func addRightBarButton(title: String, selector: Selector){
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: selector)
  }
  
}
