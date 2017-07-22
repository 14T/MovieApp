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
  var name : String?
  
  //Map object from JSON data
  init(JSON: AnyObject) {
    id = JSON.value(forKey:"topic_id") as? String
    
  }
  
  init(name : String){
    self.name = name
  }
}
