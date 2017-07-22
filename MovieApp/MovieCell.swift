//
//  MovieCell.swift
//  MovieApp
//
//  Created by Chetan Anand on 15/6/17.
//  Copyright © 2017 Chetan Anand. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var initialsLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var data: MovieViewModel? {
        didSet {
            nameLabel.text = data?.name
//            descriptionLabel.text = data?.descriptionString
//            initialsLabel.text = data?.initialsString
//            coverView.backgroundColor = data?.color
//            coverImageView.image = UIImage(named: data?.avatarString ?? "")
        }
    }
  
    override func awakeFromNib() {
        super.awakeFromNib()
        coverView.clipToRoundedCorner()
        initialsLabel.adjustsFontSizeToFitWidth = true
        initialsLabel.minimumScaleFactor = 0.5
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
