//
//  calculatorBrain.swift
//  calculator
//
//  Created by l5ee on 2017/3/23.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import Foundation

struct calculatorBrain {
    
    private var accumulator: Double?
    
    mutating func performOperation(symbol: String) {
        switch symbol {
        case "π":
            accumulator = Double.pi
        case "√":
            if let operand = accumulator {
                accumulator = (sqrt(operand))
            }
        default:
            break
        }

        
    }
    mutating func setOperand(operand: Double) {
        accumulator = operand
        
    }
    var result: Double! {
        get {
            return accumulator        }
    }
}
