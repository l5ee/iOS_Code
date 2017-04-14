//
//  ViewController.swift
//  PetAgeCalculator
//
//  Created by l5ee on 2017/4/6.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
   
    let convertor = Convertor()
    
    @IBOutlet weak var yearPicker: UIPickerView!
    
    @IBAction func giveMeAnswer(_ sender: UIButton) {
        
        
        let age = yearPicker.selectedRow(inComponent: 0)
        if let petType = self.restorationIdentifier{
            
            let resultAge = convertor.convertAge(age, fromThisPetType: petType)
            
            let resultAlert = UIAlertController(title: "Here you are!", message: "你的宠物年纪是\(resultAge)岁", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "好", style: .default, handler: { (action:UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
            })
            
            resultAlert.addAction(okButton)
            
            present(resultAlert, animated: true, completion: nil)
        }
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 20
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let yearNumber = row + 1
        if yearNumber == 1 {
            return "\(yearNumber)岁"
        }else {
            return "\(yearNumber)岁"
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.tintColor = UIColor.brown
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

