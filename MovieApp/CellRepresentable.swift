//
//  CellRepresentable.swift
//  EvaSwift
//
//  Created by Chetan Anand on 20/7/17.
//  Copyright © 2017 SMU. All rights reserved.
//

import Foundation
import UIKit

protocol CellRepresentable {
    func cellInstance(tableView : UITableView, indexPath : IndexPath) -> UITableViewCell
}
