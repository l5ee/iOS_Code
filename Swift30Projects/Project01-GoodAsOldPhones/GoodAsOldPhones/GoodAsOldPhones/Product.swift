//
//  Product.swift
//  GoodAsOldPhones
//
//  Created by l5ee on 2017/5/5.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import Foundation

class Product {
    var name: String?
    var cellImageName: String?
    var fullscreenImageName: String?
    init(name: String, cellImageName: String, fullscreenImageName: String) {
        self.name = name
        self.cellImageName = cellImageName
        self.fullscreenImageName = fullscreenImageName
    }
}
