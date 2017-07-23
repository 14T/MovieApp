//
//  MovieDetailCell.swift
//  MovieApp
//
//  Created by Chetan Anand on 23/7/17.
//  Copyright © 2017 ChetanAnand. All rights reserved.
//

import UIKit

class MovieDetailCell: UITableViewCell {

  
  @IBOutlet weak var posterImageView: UIImageView!
  @IBOutlet weak var backdropImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBOutlet weak var overviewLabel: UILabel!
  @IBOutlet weak var languagesLabel: UILabel!
  @IBOutlet weak var genresLabel: UILabel!
  @IBOutlet weak var durationLabel: UILabel!
  
  
  
  var data: MovieDetailViewModel? {
    didSet {
      titleLabel.text = data?.title
      overviewLabel.text = data?.overview
//      posterImageView.image = #imageLiteral(resourceName: "moviePlaceholder")
      languagesLabel.text = data?.languages
      genresLabel.text = data?.genres
      durationLabel.text = data?.duration
      if let url = data?.posterPathId{
        posterImageView.kf.setImage(with: url )
      }
      if let url = data?.backdropImageUrl{
        backdropImageView.kf.setImage(with: url )
      }
      
      
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()

  }
  
  override var bounds : CGRect {
    didSet {
      self.layoutIfNeeded()
    }
  }
  override func layoutSubviews() {
    super.layoutSubviews()
  }

    
}
