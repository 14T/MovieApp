//
//  HomeViewControllerTests.swift
//  MovieApp
//
//  Created by Chetan Anand on 22/7/17.
//  Copyright © 2017 ChetanAnand. All rights reserved.
//

import XCTest
@testable import MovieApp


class HomeViewControllerTests: XCTestCase {
  
  var sut : HomeViewController!
  
  override func setUp() {
    super.setUp()
    sut = HomeViewController.instanceFromStoryboard()
    _ = sut.view
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func test_HomeViewController_IsNotNill(){
    XCTAssertNotNil(sut)
  }
  
  func test_TableView_AfterViewDidLoad_IsNotNill(){
    XCTAssertNotNil(sut.tableView)
  }
  
  func test_TableViewDelegate_IsNotNill(){
    XCTAssertNotNil(sut.tableView.delegate)
  }
  
  func test_TableViewDataSource_IsNotNill(){
    XCTAssertNotNil(sut.tableView.dataSource)
  }
  
  func test_Data_isSetToCellRepresentableArray(){
    XCTAssertTrue(sut.data is [CellRepresentable])
  }
  
  func test_NumberOfRows_IsDataCountPlusOne(){

    let movieViewModel = MovieViewModel(value: Movie(name: "Test Movie"))
    sut.data.append(movieViewModel)
    sut.tableView.reloadData()
    XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), sut.data.count + 1)
  }
  
  func test_CellForRowAt_ReturnsMovieCell(){
    let movieViewModel = MovieViewModel(value: Movie(name: "Test Movie"))
    sut.data.append(movieViewModel)
    sut.tableView.reloadData()
    
    let cell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
    XCTAssertTrue(cell is MovieCell)
  }
  
  
}
