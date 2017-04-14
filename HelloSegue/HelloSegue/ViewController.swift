//
//  ViewController.swift
//  HelloSegue
//
//  Created by l5ee on 2017/4/8.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LightRedViewControllerDelegate {

    @IBOutlet weak var myTextInput: UITextField!
    
    func setColor(colorType: String) {
        if colorType == "red" {
            view.backgroundColor = UIColor.red
        }else if colorType == "green" {
            view.backgroundColor = UIColor.green
        }else if colorType == "blue" {
            view.backgroundColor = UIColor.blue
        }
    }
    
    @IBAction func changeView(_ sender: UIButton) {
        
        //检查是否输入文字
        if let inputText = myTextInput.text{
            if inputText == ""{
                //没有输入，跳出警告控制器
                let myAlert = UIAlertController(title: "没有输入", message: "请输入文字", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "好", style: .default, handler: nil)
                myAlert.addAction(okAction)
                present(myAlert, animated: true, completion: nil)
                
                
            }else{
                
                //清空字串
                myTextInput.text = ""
                //文字输入框不再成为焦点
                myTextInput.resignFirstResponder()
                //转换场景，传出文字
                performSegue(withIdentifier: "gotoView2", sender: inputText)
                
                
                
            }
            
        }
        
    }
    //传文字
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoView2" {
            if let lightRed = segue.destination as? LightRedViewController {
                lightRed.delegate = self
                lightRed.infoFromViewOne = sender as? String
            }
        }
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

