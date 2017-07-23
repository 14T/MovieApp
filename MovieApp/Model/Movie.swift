//
//  Movie.swift
//  MovieApp
//
//  Created by Chetan Anand on 22/7/17.
//  Copyright © 2017 ChetanAnand. All rights reserved.
//

import Foundation

struct Movie {
  var id : String?
  var title : String?
  var popularity : Double?
  var posterPathId : String?
  var overview : String?
  var runtime : Int?
  var backdropId : String?
  var languages = [String]()
  var genres = [String]()

  
  //Map object from JSON data
  init(JSON: AnyObject) {
    id = JSON.value(forKey:"imdb_id") as? String
    title = JSON.value(forKey:"title") as? String
    popularity = JSON.value(forKey:"popularity") as? Double
    posterPathId = JSON.value(forKey:"poster_path") as? String
    overview = JSON.value(forKey:"overview") as? String
    runtime = JSON.value(forKey:"runtime") as? Int
    backdropId = JSON.value(forKey:"backdrop_path") as? String
    if let languageArray = JSON.object(forKey:"spoken_languages") as? [NSDictionary]{
      let lan  = languageArray.flatMap({ $0.value(forKey:"name") as? String })
      languages.append(contentsOf: lan)
    }
    if let genreArray = JSON.object(forKey:"genres") as? [NSDictionary]{
      let lan  = genreArray.flatMap({ $0.value(forKey:"name") as? String })
      genres.append(contentsOf: lan)
    }

  }
  
  //For Unit Testing
  init(name : String){
    self.title = name
  }
}
