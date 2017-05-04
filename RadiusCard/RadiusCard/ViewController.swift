//
//  ViewController.swift
//  RadiusCard
//
//  Created by l5ee on 2017/5/2.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var data = [
       ShotCard(avatar: "avatar1", shotimage: "shot1", artistname: "oooops", artisedate: "by Rwds on May 1, 2017"),
       ShotCard(avatar: "avatar2", shotimage: "shot2", artistname: "oooops", artisedate: "by Rwds on May 1, 2017"),
       ShotCard(avatar: "avatar3", shotimage: "shot3", artistname: "oooops", artisedate: "by Rwds on May 1, 2017"),
    ]
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    /**
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    **/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cardcell", for: indexPath) as! CardCell
        let shot = data[indexPath.row]
        cell.avatarImageView.image = UIImage(named: shot.avatar)
        cell.shotImageView.image = UIImage(named: shot.shotimage)
        cell.artistName.text = shot.artistname
        cell.artistDate.text = shot.artisedate
        //设置选中颜色为无
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    


}

