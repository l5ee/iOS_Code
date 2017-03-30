//
//  ViewController.swift
//  HelloUIView
//
//  Created by l5ee on 2017/3/29.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var midRect: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        midRect.backgroundColor = UIColor.green
        midRect.alpha = 0.5
        self.view.backgroundColor = UIColor.black
//       view.viewWithTag(101)?.backgroundColor = UIColor.yellow
        //生成View
        let viewArea = CGRect(x: 67, y: 462, width: 97, height: 95)
        let smallRect = UIView(frame: viewArea)
        smallRect.backgroundColor = UIColor.purple
        view.viewWithTag(101)?.addSubview(smallRect)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

