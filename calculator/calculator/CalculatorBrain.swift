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
    //单目运算
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case equals
//        case allClear
    }
    
    private var operations: [String: Operation] = [
//        "AC":.allClear,
        "√":.unaryOperation(sqrt),
        "±":.unaryOperation(){-$0},
        "+":.binaryOperation({$0 + $1}),
        "−":.binaryOperation(){$0 - $1},
        "×":.binaryOperation(){$0 * $1},
        "÷":.binaryOperation(){$0 / $1},
        "=":.equals
    
    ]
    
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol]{
            switch operation {
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
            case .binaryOperation(let function):
                if accumulator != nil {
                    pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                    accumulator = nil
                    
                }
            case .equals:
                performPendingBinaryOperation()
//            case .allClear:
//                accumulator = nil
            }
            
        }

        
        
    }
    
    private mutating func performPendingBinaryOperation() {
        if pendingBinaryOperation != nil && accumulator != nil {
            accumulator = pendingBinaryOperation!.perform(with: accumulator!)
            pendingBinaryOperation = nil
        }
    }
    
    
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
        
    }
    
    var result: Double? {
        get {
            return accumulator
        }
        
    }
}
