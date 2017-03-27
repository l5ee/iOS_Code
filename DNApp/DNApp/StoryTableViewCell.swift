//
//  StoryTableViewCell.swift
//  DNApp
//
//  Created by l5ee on 2017/3/18.
//  Copyright © 2017年 Boom. All rights reserved.
//

import UIKit

protocol StoryTableViewCellDelegate: class {
    func storyTableViewCellDidTouchUpvote(cell: StoryTableViewCell, sender: AnyObject)
    func storyTableViewCellDidTouchComment(cell: StoryTableViewCell, sender: AnyObject)
}

class StoryTableViewCell: UITableViewCell {

    @IBOutlet weak var badgeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var upvoteButton: SpringButton!
    @IBOutlet weak var commentButton: SpringButton!
    weak var delegate: StoryTableViewCellDelegate?
    
    @IBAction func upvoteButtonDidTouch(_ sender: AnyObject) {
        upvoteButton.animation = "pop"
        upvoteButton.force = 3
        upvoteButton.animate()
        delegate?.storyTableViewCellDidTouchUpvote(cell: self, sender: sender)
    }

    @IBAction func commentButtonDidTouch(_ sender: AnyObject) {
        commentButton.animation = "pop"
        commentButton.force = 3
        commentButton.animate()
        delegate?.storyTableViewCellDidTouchComment(cell: self, sender: sender)
    }
    
    func configureWithStory(_story: AnyObject){
        let title = _story["title"] as! String
        let badge = _story["badge"] as! String
        let userDisplayName = _story["user_display_name"] as! String
        let userJob = _story["user_job"] as! String
        let createAt = _story["created_at"]as! String
        let voteCount  = _story["vote_count"]as! Int
        let commentCount = _story["comment_count"]as! Int
        
        titleLabel.text = title
        badgeImageView.image = UIImage(named: "badge-" + badge)
        avatarImageView.image = UIImage(named: "content-avatar-default")
        authorLabel.text = userDisplayName + ", " + userJob
        timeLabel.text = timeAgoSinceDate(date: dateFromString(date: createAt, format: "yyyy-MM-dd'T'HH:mm:ssZ"), numericDates: true)
        upvoteButton.setTitle(String(voteCount), for: UIControlState.normal)
        commentButton.setTitle(String(commentCount), for: UIControlState.normal)
    }
}
