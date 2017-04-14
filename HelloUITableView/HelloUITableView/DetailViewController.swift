//
//  DetailViewController.swift
//  HelloUITableView
//
//  Created by l5ee on 2017/4/11.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    var inForFromViewOne: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myLabel.text = inForFromViewOne
        if let okFilename = inForFromViewOne {
          myImageView.image = UIImage(named: okFilename)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
