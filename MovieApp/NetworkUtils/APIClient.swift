//
//  APIClient.swift
//  MovieApp
//
//  Created by Chetan Anand on 23/7/17.
//  Copyright © 2017 ChetanAnand. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD


class APIClient  {
  
  static let instance = APIClient()
  private init(){}
  
  var getMoviesRequest : Request?
  
  
  func getMovies(releaseDateLessThan: String, sortBy: Popularity, page : Int , completionHandler : @escaping (([Movie]?) -> ())){
    
    getMoviesRequest =   Alamofire.request(APIRouter.getMovies(releaseDateLessThan: releaseDateLessThan, sort_by: sortBy.dotNotation(), page: page)).responseJSON { (response) in
      
      switch response.result {
      case .success:
        print("Validation Successful")
        guard let responseJSON = response.result.value as? [String: Any],
          let details = responseJSON["results"] as? [AnyObject] else {
            return
        }
        let movies = details.flatMap({ Movie(JSON: $0) })
        completionHandler(movies)
        
      case .failure(let error):
        debugPrint(error)
        completionHandler(nil)
      }
    }
  }
}
