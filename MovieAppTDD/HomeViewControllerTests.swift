//
//  HomeViewControllerTests.swift
//  MovieApp
//
//  Created by Chetan Anand on 22/7/17.
//  Copyright © 2017 JumpingPixel. All rights reserved.
//

import XCTest
@testable import MovieApp


class HomeViewControllerTests: XCTestCase {
    
    var homeViewColtroller : HomeViewController!
    
    override func setUp() {
        super.setUp()
        homeViewColtroller = HomeViewController.instanceFromStoryboard()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func homeViewControllerExixts_shouldBeNotNill(){
        XCTAssertNotNil(homeViewColtroller)
    }
 
    func tableViewExists_shouldBeNotNill(){
        XCTAssertNotNil(homeViewColtroller.tableView)
    }
    
}
