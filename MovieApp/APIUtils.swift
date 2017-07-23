//
//  APIUtils.swift
//  MovieApp
//
//  Created by Chetan Anand on 23/7/17.
//  Copyright © 2017 ChetanAnand. All rights reserved.
//

import Foundation


class APIUtils  {
  
  class func getImageUrl(imageId : String?) -> String{
    guard let imageId = imageId else {return ""}
    return "\(Constants.Network.resourceBaseUrl)\(imageId)"
  }
  
  
}
