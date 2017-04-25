//
//  ViewController.swift
//  HelloGCD
//
//  Created by l5ee on 2017/4/20.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let task1 = {
            for i in 1...5 {
                print("Task1: \(i)")
            }
        }
        let task2 = {
            for i in 1...5 {
                print("Task2: \(i)")
            }
        }
        DispatchQueue.main.async(execute: task1)
        DispatchQueue.main.async(execute: task2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

