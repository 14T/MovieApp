//
//  StoryboardInitable.swift
//  EvaSwift
//
//  Created by Chetan Anand on 17/7/17.
//  Copyright © 2017 SMU. All rights reserved.
//

import Foundation
import UIKit



protocol StoryboardInitable: class {
  
  /// Specify storyboard's name in your viewController class
  static var storyboardName : String {get set}
}

extension StoryboardInitable where Self: UIViewController {
  static  var storyboardName : String {
    get {
      return ""
    }
    set{
      storyboardName = newValue
    }
  }
  
  /// Easy initialiation of viewController from storyboard
  /// 
  /// Prerequisite:
  /// - Set the viewController's identifier in storyboard same as viewController's class name
  /// - Also set the 'storyboardName' property in viewController class
  
  /// - Returns: ViewController instance from storyboard
  static func instanceFromStoryboard() -> Self {
    //Getting ViewController's class name
    let className = String(describing: Self.self).components(separatedBy: ".").last!
    //returning ViewController instance from storyboard
    return UIStoryboard(name: self.storyboardName, bundle: nil).instantiateViewController(withIdentifier: className) as! Self
  }
}

