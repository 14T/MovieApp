//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Chetan Anand on 22/7/17.
//  Copyright © 2017 ChetanAnand. All rights reserved.
//

import UIKit

import UIKit

class HomeViewController: UIViewController, StoryboardInitable, Refreshable   {
  
  static var storyboardName = "Main"
  var refreshControl: UIRefreshControl = UIRefreshControl()
  
  @IBOutlet weak var tableView: UITableView!
  var data = [CellRepresentable]()
  fileprivate var pageCount = 1
  fileprivate var isMoreDataAvailable = true
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "ShopBack Movies"
    tableView.setup(self, dataSource: self, cellClass: MovieCell.self, LoadingCell.self)
    tableView.backgroundColor = Constants.AppColor.darkGray
    
    setupRefreshControl(selector: #selector(clearAndReloadData))
    fetchData()
  }
  
  func clearAndReloadData(){
    data.removeAll()
    tableView.reloadData()
    pageCount = 1
    fetchData()
  }
  
  func fetchData() {
    
    APIClient.instance.getMovies(releaseDateLessThan: Constants.Config.startDate, sortBy: Popularity.release_dateDOTdesc, page: pageCount) { (movies) in
      guard let movies = movies else {return}
      if self.refreshControl.isRefreshing{
        self.refreshControl.endRefreshing()
      }
      
      if movies.count < 0 {
        self.isMoreDataAvailable = false
      }
      
      for item in movies{
        let movieViewModel = MovieViewModel(value: item)
        self.data.append(movieViewModel)
      }
      self.pageCount += 1
      self.tableView.reloadData()
    }
  }
}

extension HomeViewController : UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if isMoreDataAvailable {
      return data.count + 1 //With Loading Cell
    }
    else{
      return data.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == data.count {
      let loadingCell = tableView.dequeueReusableCell(withIdentifier: String(describing : LoadingCell.self)) as! LoadingCell
      return loadingCell
    }
    else{
      return data[indexPath.row].cellInstance(tableView: tableView, indexPath: indexPath)
    }
  }
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if cell.reuseIdentifier == String(describing : LoadingCell.self){
      fetchData()
    }
  }
}

extension HomeViewController : UITableViewDelegate{
  
}
