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
    
    
    //Optional
    func cellInstance(_ collectionView : UICollectionView, indexPath : IndexPath, isSelected : Bool) -> UICollectionViewCell
    
}

extension CellRepresentable{
    
    
    func cellInstance(_ collectionView : UICollectionView, indexPath : IndexPath, isSelected : Bool) -> UICollectionViewCell{
        return UICollectionViewCell()
    }
}

