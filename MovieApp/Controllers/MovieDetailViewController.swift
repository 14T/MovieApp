//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by Chetan Anand on 23/7/17.
//  Copyright © 2017 ChetanAnand. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController,StoryboardInitable, Refreshable, NavigationBarConfigurable {
  
  static var storyboardName = "Main"
  @IBOutlet weak var tableView: UITableView!
  var refreshControl: UIRefreshControl = UIRefreshControl()
  
  var data = [CellRepresentable]()
  public var movieViewModel : MovieViewModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Movie Detail"
    tableView.setup(self, dataSource: self, cellClass: MovieDetailCell.self)
    tableView.backgroundColor = Constants.AppColor.darkGray
    setupRefreshControl(selector: #selector(clearAndReloadData))
    addRightBarButton(title: "Book", selector: #selector(showBookingView))
    
    fetchData()
  }
  
  func clearAndReloadData(){
    data.removeAll()
    tableView.reloadData()
    fetchData()
  }
  
  func fetchData() {
    
    APIClient.instance.getMovieDetail(id: movieViewModel?.id ?? "", completionHandler: { (movie) in
      if self.refreshControl.isRefreshing{
        self.refreshControl.endRefreshing()
      }
      guard let movie = movie else{
        if let movieObject = self.movieViewModel?.movieObject {
          self.data.append(MovieDetailViewModel(value: movieObject))
          self.tableView.reloadData()
        }
        return
        
      }
      

      
      self.data.append(MovieDetailViewModel(value: movie))
      
      self.tableView.reloadData()
    }
    )
  }
  
  func showBookingView(){
    let vc = BookingViewController.instanceFromStoryboard()
    navigationController?.pushViewController(vc, animated: true)
  }
}

extension MovieDetailViewController : UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return data[indexPath.row].cellInstance(tableView: tableView, indexPath: indexPath)
  }
}

extension MovieDetailViewController : UITableViewDelegate{
  
}

