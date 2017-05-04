//
//  CardCell.swift
//  RadiusCard
//
//  Created by l5ee on 2017/5/2.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

struct ShotCard{
    let avatar: String
    let shotimage: String
    let artistname: String
    let artisedate: String
    
}

class CardCell: UITableViewCell {

    @IBOutlet weak var shotImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var artistDate: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // Card圆角
        cardView.layer.cornerRadius = 12
        cardView.layer.masksToBounds = true
        //生成圆角图片
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        avatarImageView.layer.borderWidth = 1
        avatarImageView.layer.borderColor = UIColor(red:0.79, green:0.79, blue:0.79, alpha:1.00).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
