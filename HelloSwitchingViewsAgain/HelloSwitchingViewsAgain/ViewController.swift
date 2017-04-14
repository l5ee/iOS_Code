//
//  ViewController.swift
//  HelloSwitchingViewsAgain
//
//  Created by l5ee on 2017/4/8.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func gotoView2(_ sender: UIButton) {
        //转换视图
        let lightRed = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "lightRed")
        //从上到下
//        present(lightRed, animated: true, completion: nil)
        //从右到左
        self.navigationController?.pushViewController(lightRed, animated: true)
        
        
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

