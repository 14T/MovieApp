//
//  Refreshable.swift
//  Conference
//
//  Created by Chetan Anand on 25/4/17.
//  Copyright © 2017 LiveLabs. All rights reserved.
//

import Foundation
import UIKit


protocol Refreshable {
  /// The refresh control
  var refreshControl: UIRefreshControl { get set }
  /// The table view
  var tableView: UITableView! { get set }
}

extension Refreshable where Self: UIViewController {

   func setupRefreshControl(selector: Selector){

    refreshControl.backgroundColor = UIColor.clear
    refreshControl.addTarget(self, action: selector, for: .valueChanged)

    tableView.addSubview(refreshControl)
    
    
//    if #available(iOS 10.0, *)
//    {
//      tableView.refreshControl = refreshControl
//    }
//    else
//    {
//      tableView.backgroundView = refreshControl
//    }
  }
  
  func endRefreshing(){
    refreshControl.endRefreshing()
  }
  
  func isRefreshing() -> Bool{
    return refreshControl.isRefreshing
  }
  
}


