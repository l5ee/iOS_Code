//
//  ViewController.swift
//  HelloUserDefault
//
//  Created by l5ee on 2017/4/13.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //存储用户数据
//        UserDefaults.standard.set("l5ee", forKey: "name")
//        UserDefaults.standard.synchronize()
        
        //读取用户数据
        if let loadedName = UserDefaults.standard.value(forKey: "name") as? String {
           print(loadedName)
        }
        
//        let fruitArray = ["apple", "banana", "mango"]
//        UserDefaults.standard.set(fruitArray, forKey: "sweetFruit")
//        UserDefaults.standard.synchronize()
        
        
        if let loadedFruit = UserDefaults.standard.stringArray(forKey: "sweetFruit") {
            print(loadedFruit[0])
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

