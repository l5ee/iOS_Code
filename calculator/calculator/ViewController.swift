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

        for i in 0..<caculatorButton.count {
            caculatorButton[i].layer.borderColor = UIColor(colorLiteralRed: 0.08, green: 0.49, blue: 0.98, alpha: 1).cgColor
            caculatorButton[i].layer.borderWidth = 1
        }
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            
            if digit == "AC" {
                display.text = "0"
            }else {
                let currentlyInDisplay = display.text!
                display.text = currentlyInDisplay + digit
            }
            
            
        } else {
            if digit == "AC" {
                display.text = "0"
            }else {
                display.text = digit
                userIsInTheMiddleOfTyping = true
            }
            
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











