//
//  ViewController.swift
//  HelloUIAlertController
//
//  Created by l5ee on 2017/3/29.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showAlert(_ sender: UIButton) {
        
        let myAlert = UIAlertController(title: "你好", message: nil, preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "好", style: .default) {
            (action:UIAlertAction) in
            
        }
        myAlert.addAction(okAction)
        
        let helloAction = UIAlertAction(title: "你好", style: .default) {
            (action:UIAlertAction) in
            print("Hello")
        }
        myAlert.addAction(helloAction)
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) {
            (action:UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }
        myAlert.addAction(cancelAction)
        
        
        
        
        present(myAlert, animated: true, completion: nil)
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

