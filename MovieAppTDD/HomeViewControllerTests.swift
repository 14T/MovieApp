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
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_HomeViewController_IsNotNill(){
        XCTAssertNotNil(sut)
    }
 
    func test_TableView_AfterViewDidLoad_IsNotNill(){
        XCTAssertNotNil(sut.tableView)
    }
    
}
