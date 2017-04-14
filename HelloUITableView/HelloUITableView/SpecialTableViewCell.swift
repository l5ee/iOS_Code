//
//  SpecialTableViewCell.swift
//  HelloUITableView
//
//  Created by l5ee on 2017/4/13.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class SpecialTableViewCell: UITableViewCell {

    @IBOutlet weak var specialImageView: UIImageView!
    @IBOutlet weak var specialLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
