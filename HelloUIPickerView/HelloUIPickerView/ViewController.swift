//
//  ViewController.swift
//  HelloUIPickerView
//
//  Created by l5ee on 2017/3/31.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let numberArray = ["1", "2", "3", "4", "5", "6", "7", "8"]
    let fruitArray = ["apple", "banana", "manggo", "watermelon"]
    
    //在pickview中有多少个component
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    //在component中有多少row
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return numberArray.count
        }else{
            return fruitArray.count
        }
        
    }
    //显示什么类容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return numberArray[row]
            
        }else{
            return fruitArray[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            print("number:\(numberArray[row])")
        }else{
            print("fruit:\(fruitArray[row])")
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

