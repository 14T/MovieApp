//
//  APIRouter.swift
//  MovieApp
//
//  Created by Chetan Anand on 23/7/17.
//  Copyright © 2017 ChetanAnand. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
  static var baseURL = Constants.Network.baseUrl
  
  case getMovies(releaseDateLessThan: String, sort_by: String, page : Int )
  case getMovieDetail(id: String)
  
  // MARK: - path
  var path: String {
    switch self {
    case .getMovies:
      return "/discover/movie"
    case .getMovieDetail(let id):
      return "/movie/\(id)"
    }
  }
  
  //MARK:  Parameters
  var parameters: Parameters {
    var params: Parameters = [:]
    switch self {
    case .getMovies(let releaseDateLessThan,let  sort_by, let page):
      params = [
        "api_key": Constants.Config.apiKey,
        "primary_release_date.lte": releaseDateLessThan,
        "sort_by": sort_by,
        "page": page]
    case .getMovieDetail(_):
      params = [
        "api_key": Constants.Config.apiKey
      ]
    }
    return params
  }
  
  //MARK: HTTPMethod
  var method: HTTPMethod {
    return .get
  }
  
  // MARK: - URLRequestConvertible
  func asURLRequest() throws -> URLRequest {
    
    let url = try APIRouter.baseURL.asURL()
    
    var request = URLRequest(url: url.appendingPathComponent(path))
    request.httpMethod = method.rawValue
    request.timeoutInterval = TimeInterval(10 * 1000)
    
    return try URLEncoding.default.encode(request, with: parameters)
  }
}
