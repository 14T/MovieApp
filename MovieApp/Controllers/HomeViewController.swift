//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Chetan Anand on 22/7/17.
//  Copyright © 2017 ChetanAnand. All rights reserved.
//

import UIKit

import UIKit

class HomeViewController: UIViewController, StoryboardInitable   {
  
  static var storyboardName = "Main"
  
  @IBOutlet weak var tableView: UITableView!
  var data = [CellRepresentable]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.setup(self, dataSource: self, cellClass: MovieCell.self)
    fetchData()
  }
  
  func fetchData() {
    
    APIClient.instance.getMovies(releaseDateLessThan: Constants.Config.startDate, sortBy: Popularity.release_dateDOTdesc, page: 1) { (movies) in
      guard let movies = movies else {return}
      for item in movies{
      let movieViewModel = MovieViewModel(value: item)
      self.data.append(movieViewModel)
      }
      self.tableView.reloadData()
    }
  }
}

extension HomeViewController : UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return data[indexPath.row].cellInstance(tableView: tableView, indexPath: indexPath)
  }
}

extension HomeViewController : UITableViewDelegate{
  
}
