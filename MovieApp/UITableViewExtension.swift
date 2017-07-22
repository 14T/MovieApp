//
//  UITableViewExtension.swift
//  MovieApp
//
//  Created by Chetan Anand on 22/7/17.
//  Copyright © 2017 ChetanAnand. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
  func setup(_ delegate : UITableViewDelegate, dataSource : UITableViewDataSource, cellClass : AnyClass...){
    
    self.dataSource = dataSource
    self.delegate = delegate
    
    self.estimatedRowHeight = 33
    self.rowHeight = UITableViewAutomaticDimension
    for arg: AnyClass in cellClass {
      let className = String(describing: arg)
      self.register(UINib(nibName: className , bundle: nil), forCellReuseIdentifier: className)
    }
    self.tableFooterView = UIView()
  }
}
