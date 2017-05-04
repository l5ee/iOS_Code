//
//  ViewController.swift
//  calculator
//
//  Created by l5ee on 2017/3/22.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    @IBOutlet var caculatorButton: [UIButton] = []
    
    var userIsInTheMiddleOfTyping = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //数字按钮描边
        for i in 0..<caculatorButton.count {
            caculatorButton[i].layer.borderColor = UIColor(colorLiteralRed: 0.08, green: 0.49, blue: 0.98, alpha: 1).cgColor
            caculatorButton[i].layer.borderWidth = 0.5
        }
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            
            switch digit {
            case "AC":
                display.text = "0"
            case ".":
                if display.text!.contains(".") == false {
                    let currentlyInDisplay = display.text!
                    display.text = currentlyInDisplay + digit
                }

            default:
                if (display.text?.characters.count)! <= 10 {
                    if display.text! == "0" {
                        display.text = digit
                    } else {
                        let currentlyInDisplay = display.text!
                        display.text = currentlyInDisplay + digit
                    }
                }
                

            }
            
            
            
            
        } else {
            switch digit {
            case "AC":
                display.text = "0"
            case ".":
                let currentlyInDisplay = display.text!
                display.text = currentlyInDisplay + digit
            case "0":
                display.text = "0"
            default:
                display.text = digit
                
            }
            userIsInTheMiddleOfTyping = true
        }
        
    }
    
    
    
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
            
        }
        set {
            display.text = String(newValue)
            
        }
    }
    
    private var brain = calculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        
        if userIsInTheMiddleOfTyping{
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }

        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        
        if let result = brain.result{
            displayValue = result
           
        }
        
    }

    


}











