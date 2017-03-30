//
//  ViewController.swift
//  WhatsTheNumber
//
//  Created by l5ee on 2017/3/27.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: SpringLabel!
    @IBOutlet weak var messageLabel: SpringLabel!
    @IBOutlet weak var inputTexxtFiled: SpringTextField!
    @IBOutlet weak var guessButton: SpringButton!
    var maxNumber = 100
    var minNumber = 1
    var isOver = false
    
    //Make a random number
    var answer = Int(arc4random_uniform(100) + 1)
    
    @IBAction func makeAGuess(_ sender: AnyObject) {
        
        if isOver == false{
            //playing game
            print("answer = \(answer)")
            let inpuText = inputTexxtFiled.text!
            
            //clear textfield
            inputTexxtFiled.text = ""
            
            let inputNumber = Int(inpuText)
            print("inputNumber = \(String(describing: inputNumber))")
            
            if inputNumber == nil{
                //no input
//                messageLabel.textColor = rgbaToUIColor(red: 248, green: 231, blue: 28, alpha: 100)
                messageLabel.text = "没有输入!请猜出在\(minNumber) ~ \(maxNumber)的数字"
                inputTexxtFiled.animation = "shake"
                inputTexxtFiled.animate()
            }else{
                //got input
                if inputNumber! > maxNumber{
                    messageLabel.text = "猜大了哦! 请猜出在\(minNumber) ~ \(maxNumber)的数字"
                }else if inputNumber! < minNumber{
                    messageLabel.text = "猜的太小了! 请猜出在\(minNumber) ~ \(maxNumber)的数字"
                }else{
                    //check answer
                    if inputNumber == answer{
                        //Bing! right answer!
//                        messageLabel.textColor = UIColor.black
                        messageLabel.text = "牛逼！您猜对了 点击按钮重玩"
                        isOver = true
                    }else{
                        //wrong answer
                        if inputNumber! > answer{
                            //larger than answer
                            maxNumber = inputNumber!
                            
                        }else{
                            //smaller than answer
                            minNumber = inputNumber!
                            
                        }
                        messageLabel.text = "接近了! 请猜出在\(minNumber) ~ \(maxNumber)的数字"
                    }
                }
            }
        }else{
            //game is over
            maxNumber = 100
            minNumber = 1
            messageLabel.text = "请猜出在\(minNumber) ~ \(maxNumber)的数字"
            answer = Int(arc4random_uniform(100) + 1)
            isOver = false
        }
        
        
    }
    
    //Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Push keyboard up
        titleLabel.animation = "squeezeDown"
        titleLabel.animate()
        messageLabel.animation = "squeezeDown"
        messageLabel.animate()
//        guessButton.animation = "squeezeDown"
//        guessButton.animate()
//        
        inputTexxtFiled.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

