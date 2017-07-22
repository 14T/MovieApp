//
//  Movie.swift
//  MovieApp
//
//  Created by Chetan Anand on 22/7/17.
//  Copyright © 2017 ChetanAnand. All rights reserved.
//

import Foundation

struct Movie {
  var id : Int?
  var title : String?
  var popularity : Double?
  var posterPathId : String?
  
  //Map object from JSON data
  init(JSON: AnyObject) {
    id = JSON.value(forKey:"id") as? Int
    title = JSON.value(forKey:"title") as? String
    popularity = JSON.value(forKey:"popularity") as? Double
    posterPathId = JSON.value(forKey:"poster_path") as? String
  }
  
  //For Unit Testing
  init(name : String){
    self.title = name
  }
}
