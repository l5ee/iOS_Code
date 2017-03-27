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
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let currentlyInDisplay = display.text!
            display.text = currentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
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
            brain.setOperand(operand: displayValue)
            
        }
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathematicalSymbol)
        }
        if let result = brain.result{
            displayValue = result
           
        }
            
    }

}





