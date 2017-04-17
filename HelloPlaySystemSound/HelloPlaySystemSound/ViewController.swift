//
//  ViewController.swift
//  HelloPlaySystemSound
//
//  Created by l5ee on 2017/4/17.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    @IBAction func play(_ sender: UIButton) {
        AudioServicesPlaySystemSound(1000)
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

