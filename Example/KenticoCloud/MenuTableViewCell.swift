//
//  MenuTableViewCell.swift
//  KenticoCloud
//
//  Created by Martin Makarsky on 16/08/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {


    @IBOutlet var menuOption: UILabel!
    @IBOutlet var menuImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
