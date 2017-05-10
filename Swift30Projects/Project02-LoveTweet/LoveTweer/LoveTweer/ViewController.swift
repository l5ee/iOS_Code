//
//  ViewController.swift
//  LoveTweer
//
//  Created by l5ee on 2017/5/6.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var workTextField: UITextField!
    @IBOutlet weak var genderSeg: UISegmentedControl!
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    @IBOutlet weak var straightSwitch: UISwitch!
    @IBOutlet weak var salaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        workTextField.delegate = self
    }
    //
    @IBAction func salaryHandler(_ sender: UISlider) {
        let slider = sender
        salaryLabel.text = "\(Int(slider.value))K"
    }
    

    @IBAction func tweetTapped(_ sender: UIButton) {
        //数据为空弹出警告控制器
        if nameTextField.text == ""||workTextField.text == ""||salaryLabel.text == "" {
            showAlert("没有填完", message: "请填完所有内容", buttonTitle: "要得")
            return
        }
        
        let name:String = nameTextField.text!
        let work:String = workTextField.text!
        let salary: String = salaryLabel.text!
        
        //获得年龄
        
        //设定公历
        let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)
        //
        let nowDate = Date()
        let ageComponent = gregorian.dateComponents([Calendar.Component.year], from: birthdayPicker.date, to: nowDate )
        let age = ageComponent.year!
        //print("Your age is \(age)")
        
        //获得性别
        var interestedIn:String! = "美女"
        if (genderSeg.selectedSegmentIndex == 0 && !straightSwitch.isOn) {
            interestedIn = "帅哥"
        }
        if (genderSeg.selectedSegmentIndex == 1 && straightSwitch.isOn ) {
            interestedIn = "美女"
        }
        
        let weibo = "我是 \(name)，\(age)岁了。工作是\(work)。 收入每月\(salary),我对\(interestedIn!)感兴趣。 记得联系我!"
        
        weiboSLCVC(weibo)
        
    }
    //警告控制器
    func showAlert(_ title: String, message: String, buttonTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    //return后关闭键盘
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //发微博
    func weiboSLCVC(_ weibo: String) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeSinaWeibo) {
            let controller: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeSinaWeibo)
            controller.setInitialText(weibo)
            self.present(controller, animated: true, completion: nil)
        }else {
            showAlert("发不了微博", message: "确认是否在设置中填入了微博账户", buttonTitle: "要得")
        }
        
        
        
    }


}

