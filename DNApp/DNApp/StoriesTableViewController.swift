//
//  StoriesTableViewController.swift
//  DNApp
//
//  Created by l5ee on 2017/3/17.
//  Copyright © 2017年 Boom. All rights reserved.
//

import UIKit

class StoriesTableViewController: UITableViewController, StoryTableViewCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        //cell默认高度100，自动计算高度
    }
    
    
    
    

    
    @IBAction func menuButtonDidTouch(_ sender: AnyObject) {
        performSegue(withIdentifier: "MenuSegue", sender: self)
        
    }

    @IBAction func loginButtonDidTouch(_ sender: AnyObject) {
        performSegue(withIdentifier: "LoginSegue", sender: self)
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCell") as! StoryTableViewCell!
        let story = data[indexPath.row]
        cell?.configureWithStory(_story: story as AnyObject)
        
        
        cell?.delegate = self
        
        
        
        return cell!
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "WebSegue", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    
    }
    //MARK: StoryTableViewCellDelegate
    
    func storyTableViewCellDidTouchUpvote(cell: StoryTableViewCell, sender: AnyObject) {
        //TODO: Implement Upvote
        
    }
    func storyTableViewCellDidTouchComment(cell: StoryTableViewCell, sender: AnyObject) {
        performSegue(withIdentifier: "CommentsSegue", sender: cell)
    }

    
}
