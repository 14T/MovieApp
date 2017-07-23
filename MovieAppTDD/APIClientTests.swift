//
//  APIClientTests.swift
//  MovieApp
//
//  Created by Chetan Anand on 23/7/17.
//  Copyright © 2017 ChetanAnand. All rights reserved.
//

import XCTest
@testable import MovieApp

class APIClientTests: XCTestCase {

  var sut : APIClient!

  override func setUp() {
    super.setUp()
    
    sut = APIClient.instance
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func test_getMovieList_ShouldBeNotNil(){

    // 1. Define an expectation
    let expect = expectation(description: "API CLient Test")
    
    // 2. Exercise the asynchronous code
    sut.getMovies(releaseDateLessThan: Constants.Config.startDate, sortBy: Popularity.release_dateDOTdesc, page: 1) { (result) in
      XCTAssertNotNil(result)
      expect.fulfill()
    }
    // 3. Wait for the expectation to be fulfilled
    waitForExpectations(timeout: 100) { error in
      if let error = error {
        XCTFail("waitForExpectationsWithTimeout errored: \(error)")
      }
    }
  }
  
  func test_getMovieDetail_ShouldBeNotNil(){
    
    // 1. Define an expectation
    let expect = expectation(description: "API CLient Test")
    
    // 2. Exercise the asynchronous code
    sut.getMovieDetail(id: "tt3890160") { (result) in
      XCTAssertNotNil(result)
      expect.fulfill()
    }

    // 3. Wait for the expectation to be fulfilled
    waitForExpectations(timeout: 100) { error in
      if let error = error {
        XCTFail("waitForExpectationsWithTimeout errored: \(error)")
      }
    }
  }
  
}
