//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Chetan Anand on 22/7/17.
//  Copyright © 2017 ChetanAnand. All rights reserved.
//

import Foundation
import UIKit

struct MovieViewModel : CellRepresentable {
  
  private var movie : Movie
  
  init(value : Movie) {
    self.movie = value
  }
  
  var name : String? {
    return movie.name
  }
  
  
}

extension MovieViewModel{
  func cellInstance(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
    cell.data = self
    return cell
  }
  
}
