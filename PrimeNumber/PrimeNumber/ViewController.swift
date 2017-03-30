//
//  ViewController.swift
//  PrimeNumber
//
//  Created by l5ee on 2017/3/29.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextfield: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func doThePrimeText(_ sender: UIButton) {
        //拿出文字输入框文字
        //把数字字串转换成整数
        //用checkPrime函数检查是否为质数
        //用resultLabel秀出结果
        if  let inputText = inputTextfield.text, let inputNumber = Int(inputText){
//                resultLabel.text = checkPrime(testNumber: inputNumber)
//                resultLabel.isHidden = false
                checkPrime(testNumber: inputNumber){
                    self.resultLabel.text = $0
                    self.resultLabel.isHidden = false
                
                
            }
        }
        inputTextfield.text = ""
        

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 弹出键盘
        inputTextfield.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func checkPrime(testNumber:Int) -> String{
        var isPrime = 1 // 1: is Prime; 2: is not Prime; 0: reenter
        if testNumber <= 0{
            isPrime = 0 // reenter
        }else if testNumber == 1{
            isPrime = 2 // not Prime
        }else{
            for i in 2 ..< testNumber{
                if testNumber % i == 0{
                    //inputNumber is not prime
                    isPrime = 2
                }
            }
        }
        switch isPrime {
        case 1:
            return "\(testNumber)是质数"
        case 2:
            return "\(testNumber)不是质数"
        default:
            return "请输入大于0的数字"
        }
        
    }
    
    func checkPrime(testNumber number:Int, withCompletionHandler handler:(String)->()){
        handler(checkPrime(testNumber: number))
    }
    
    
}

