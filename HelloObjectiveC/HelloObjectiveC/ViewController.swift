//
//  ViewController.swift
//  HelloObjectiveC
//
//  Created by l5ee on 2017/4/20.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let calculator = OBJCCalculator()
        calculator.add(5, secondNumber: 10)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

