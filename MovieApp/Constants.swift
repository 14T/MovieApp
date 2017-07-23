//
//  Constants.swift
//  MovieApp
//
//  Created by Chetan Anand on 22/7/17.
//  Copyright © 2017 ChetanAnand. All rights reserved.
//


import Foundation
import UIKit

/// All Constants used in the App
/// Note :  Using case-less ENUM as Constatnts because of its non-initializable property
enum Constants{
  
  /// General App Configurations
  enum Config {
    static let isDevelopment  = true
    static let apiKey = "6c29f59fe30eb048559ee929fb949c15"  // Got it after registering at IMDB Developer portal
    static let startDate = "2016-12-31"
    static let bookingUrl = "http://www.cathaycineplexes.com.sg/"
  }
  
  /// Network Constatnts
  enum Network {
    static var baseUrl : String{
      let devUrl = "http://api.themoviedb.org/3"
      let prodUrl = "http://api.themoviedb.org/3"
      return Config.isDevelopment ? devUrl : prodUrl
    }
    
    static var resourceBaseUrl : String{
      let devUrl = "https://image.tmdb.org/t/p/w500"
      let prodUrl = "https://image.tmdb.org/t/p/w500"
      return Config.isDevelopment ? devUrl : prodUrl
    }
    
  }
  
  enum AppColor {
    static let darkGray = UIColor(red:0.15,green:0.15,blue:0.15,alpha:1.00)
    static let navBar = UIColor(red:0.09,green:0.09,blue:0.09,alpha:1.00)
  }
  

  
  
}
