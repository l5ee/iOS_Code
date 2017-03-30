//
//  ViewController.swift
//  HelloUISwitch
//
//  Created by l5ee on 2017/3/29.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBAction func makeAChange(_ sender: UISwitch) {
        //用isOn来检查switch的状态
        if sender.isOn == true{
            view.backgroundColor = UIColor.white
        }else{
            view.backgroundColor = UIColor.black
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mySwitch.isOn = false
        makeAChange(mySwitch)
        
        
        //用代码生成一个switch
        let codeSwitch = UISwitch(frame: CGRect(x: view.frame.midX - 51/2, y: view.frame.maxY - 100, width: 51, height: 31))
//        codeSwitch.isOn = true
        codeSwitch.addTarget(self, action: #selector(ViewController.codeSwitchChange(sender:)), for: .valueChanged)
        
        
        view.addSubview(codeSwitch)
    }
    
    func codeSwitchChange(sender: UISwitch) {
        if sender.isOn == true{
            view.backgroundColor = UIColor.white
        }else{
            view.backgroundColor = UIColor.black
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

