//
//  ViewController.swift
//  HelloUISegmentedControl
//
//  Created by l5ee on 2017/3/29.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func myToggleChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            view.backgroundColor = UIColor.black
        case 2:
            view.backgroundColor = UIColor.red
        case 3:
            view.backgroundColor = UIColor.orange
        case 4:
            view.backgroundColor = UIColor.yellow
        default:
            view.backgroundColor = UIColor.white
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

