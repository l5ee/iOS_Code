//
//  LightRedViewController.swift
//  HelloSegue
//
//  Created by l5ee on 2017/4/8.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

protocol LightRedViewControllerDelegate {
    func setColor(colorType: String)
}


class LightRedViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var myLabel: UILabel!
    var infoFromViewOne: String?
    let colorArray = ["red","green","blue"]
    var delegate:LightRedViewControllerDelegate?
    
    
    
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBAction func backtoViewOne(_ sender: UIButton) {
        let colorNumber = myPickerView.selectedRow(inComponent: 0)
        let color = colorArray[colorNumber]
        
        delegate?.setColor(colorType: color)
        
        
        navigationController?.popViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = infoFromViewOne
        myPickerView.dataSource = self
        myPickerView.delegate = self
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colorArray[row]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
