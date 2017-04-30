//
//  ViewController.swift
//  UIKitTest
//
//  Created by l5ee on 2017/4/28.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redView = UIView.init()
        redView.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        redView.backgroundColor = UIColor.init(red: 30/255.0, green: 133/255.0, blue: 26/255.0, alpha: 1)
        redView.transform = CGAffineTransform(rotationAngle: CGFloat( M_PI_4))
        self.view.addSubview(redView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

