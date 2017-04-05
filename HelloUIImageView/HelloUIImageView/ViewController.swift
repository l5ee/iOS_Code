//
//  ViewController.swift
//  HelloUIImageView
//
//  Created by l5ee on 2017/3/31.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myPet: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myPet.image = UIImage(named: "MyDog")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

