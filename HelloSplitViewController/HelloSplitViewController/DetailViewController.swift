//
//  DetailViewController.swift
//  HelloSplitViewController
//
//  Created by l5ee on 2017/4/25.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    var detailItem:String?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if detailItem == nil {
            title = "iPhone"
            detailDescriptionLabel.text = "iPhone"
        }else {
            title = detailItem
            detailDescriptionLabel.text = detailItem
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    


}

