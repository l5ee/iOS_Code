//
//  ViewController.swift
//  HelloUIButton
//
//  Created by l5ee on 2017/3/31.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func buttonPressed(_ sender: UIButton) {
        view.backgroundColor = UIColor.black
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //怎么用代码产生系统按钮
        let newButton = UIButton(type: .system)
        newButton.frame = CGRect(x: 50, y: 50, width: 100, height: 50)
        newButton.setTitle("Press", for: .normal)
        newButton.setTitle("Pressed", for: .highlighted)
        
        view.addSubview(newButton)
        
        newButton.addTarget(self, action: #selector(ViewController.hitMe(thisButton:)), for: .touchUpInside)
        //怎么用代码产生有图片的按钮
        let anotherButton = UIButton(type: .custom)
        anotherButton.frame = CGRect(x: 200, y: 200, width: 114, height: 54)
        anotherButton.setImage(UIImage(named:"PlayButton"), for: .normal)
        anotherButton.setImage(UIImage(named: "PlayButtonPressed"), for: .highlighted)
        view.addSubview(anotherButton)
        anotherButton.addTarget(self, action: #selector(ViewController.hitMe(thisButton:)), for: .touchUpInside)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func hitMe(thisButton:UIButton){
        print("hello, just pressed button")
    }

}

