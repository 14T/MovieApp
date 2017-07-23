//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Chetan Anand on 23/7/17.
//  Copyright © 2017 ChetanAnand. All rights reserved.
//

import Foundation
import UIKit

struct MovieDetailViewModel : CellRepresentable {
  
  private var movie : Movie
  
  init(value : Movie) {
    self.movie = value
  }
  
  var title : String? {
    return movie.title
  }
  var overview : String? {
    return "Synopsis:  \(movie.overview ?? "Data Not available")"
  }
  var duration : String? {
    if let runTime = movie.runtime{
      return "Duration:     \(runTime)"
    }
    return "Duration:     Data Not available"
  }
  
  var posterPathId : URL? {
    return URL(string: APIUtils.getImageUrl(imageId: movie.posterPathId))
  }
  
  var backdropImageUrl : URL? {
    return URL(string: APIUtils.getImageUrl(imageId: movie.backdropId))
  }
  
  var languages : String? {
    let languagesString  = movie.languages.reduce(""){ lang1, lang2 in
      "\(lang1)  \(lang2)"
    }
    
    if languagesString.characters.count == 0{
      return "Languages: Data Not available"
    }
    return "Languages: \(languagesString)"
  }
  var genres : String? {
    let genresString  = movie.genres.reduce(""){ gen1, gen2 in
      "\(gen1)  \(gen2)"
    }
    if genresString.characters.count == 0{
      return "Genres:        Data Not available"
    }
    return "Genres:        \(genresString)"
  }
  

  
  
}

extension MovieDetailViewModel{
  func cellInstance(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailCell", for: indexPath) as! MovieDetailCell
    cell.data = self
    return cell
  }
}
