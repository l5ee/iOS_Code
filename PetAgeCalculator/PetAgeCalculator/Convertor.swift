//
//  Convertor.swift
//  PetAgeCalculator
//
//  Created by l5ee on 2017/4/7.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import Foundation

class Convertor {
    
    let catyears = [15,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96]
    let dogyears = [17,23,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96]
    
    func convertAge(_ age:Int, fromThisPetType petType:String) -> Int {
        if petType == "cat" {
            return catyears[age]
        }else {
            return dogyears[age]
        }
    }
    
}
