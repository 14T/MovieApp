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
  
  var id : String {
    return  movie.id  ?? ""
  }
  
  var title : String? {
    return movie.title
  }
  var popularity : String? {
    return "Popularity: \(movie.popularity?.roundTo(places: 2) ?? 0)"
  }
  
  var posterPathId : URL? {
    return URL(string: APIUtils.getImageUrl(imageId: movie.posterPathId))
  }
 
  //Exposing movie because of special requirement
  var movieObject : Movie {
    return movie
  }
  
}

extension MovieViewModel{
  func cellInstance(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
    cell.data = self
    return cell
  }
  
}
