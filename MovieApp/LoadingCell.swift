//
//  LoadingCell.swift
//  Conference
//
//  Created by Chetan Anand on 21/4/17.
//  Copyright © 2017 LiveLabs. All rights reserved.
//

import UIKit

class LoadingCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      separatorInset = UIEdgeInsets(top: 0, left: 10000, bottom: 0, right: 0)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
