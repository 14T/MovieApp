//
//  MovieCell.swift
//  MovieApp
//
//  Created by Chetan Anand on 15/6/17.
//  Copyright © 2017 Chetan Anand. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {
  
  @IBOutlet weak var coverView: UIView!
  @IBOutlet weak var initialsLabel: UILabel!
  @IBOutlet weak var coverImageView: UIImageView!
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var backdropImageView: UIImageView!
  
  var data: MovieViewModel? {
    didSet {
      nameLabel.text = data?.title
      descriptionLabel.text = data?.popularity
      coverImageView.image = #imageLiteral(resourceName: "moviePlaceholder")
      //      backdropImageView.image = #imageLiteral(resourceName: "moviePlaceholder")
      
      if let url = data?.posterPathId{
        coverImageView.kf.setImage(with: url )
        backdropImageView.kf.setImage(with: url)
      }
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    coverView.clipToRoundedCorner(withBorderWidth: 1, borderColor: UIColor.white)
    
    
    //TODO: UI Improvement
    initialsLabel.adjustsFontSizeToFitWidth = true
    initialsLabel.minimumScaleFactor = 0.5
    
    let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.frame = backdropImageView.bounds
    blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    backdropImageView.addSubview(blurEffectView)
    
    
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
