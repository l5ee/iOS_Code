//
//  ViewController.swift
//  MyAlertTest
//
//  Created by l5ee on 2017/4/15.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func addAlert(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Hi", message: "我是Alert", preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
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

