//
//  APIDefaults.swift
//  MovieApp
//
//  Created by Chetan Anand on 23/7/17.
//  Copyright © 2017 ChetanAnand. All rights reserved.
//

import Foundation

//MARK: IMDB API defaults

enum Popularity: String {
  case popularityDOTasc
  case popularityDOTdesc
  case release_dateDOTasc
  case release_dateDOTdesc
  case revenueDOTasc
  case revenueDOTdesc
  case primary_release_dateDOTasc
  case primary_release_dateDOTdesc
  case original_titleDOTasc
  case original_titleDOTdesc
  case vote_averageDOTasc
  case vote_averageDOTdesc
  case vote_countDOTasc
  case vote_countDOTdesc
  
  /// Popularity used as per IMDB Standards
  ///
  /// - Returns: string replacing DOT with a period as required by IMDB APIs
  func dotNotation() -> String{
    return self.rawValue.replacingOccurrences(of: "DOT", with: ".")
  }
}
