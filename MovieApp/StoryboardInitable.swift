//
//  StoryboardInitable.swift
//  EvaSwift
//
//  Created by Chetan Anand on 17/7/17.
//  Copyright © 2017 SMU. All rights reserved.
//

import Foundation
import UIKit

/*
 UIViewController A which adopt this protocol must make sure that it has
 + Storyboard whose name is classname. e.g: A.storyboard OR where storyboard name is first word of camelcase string of classname
 + ReuseIdentifier in the Storyboard above same as class name: e.g: reuse = "A"
 */

protocol StoryboardInitable: class {
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
    static func instanceFromStoryboard() -> Self {
        let className = String(describing: Self.self).components(separatedBy: ".").last!
        return UIStoryboard(name: self.storyboardName, bundle: nil).instantiateViewController(withIdentifier: className) as! Self
    }
}

