//
//  ViewController.swift
//  ColorFinder
//
//  Created by l5ee on 2017/3/29.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var redValue = 255
    var greenValue = 255
    var blueValue = 255

    @IBOutlet weak var redText: UILabel!
    @IBOutlet weak var greenText: UILabel!
    @IBOutlet weak var blueText: UILabel!
    
    @IBAction func redSlideChanged(_ sender: UISlider) {
        redValue = Int(sender.value)
        redText.text = "R:\(redValue)"
        changeBackgroundColor()
    }
    @IBAction func greenSlideChanged(_ sender: UISlider) {
        greenValue = Int(sender.value)
        greenText.text = "R:\(greenValue)"
        changeBackgroundColor()
    }
    @IBAction func blueSlideChanged(_ sender: UISlider) {
        blueValue = Int(sender.value)
        blueText.text = "R:\(blueValue)"
        changeBackgroundColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeBackgroundColor(){
//        view.backgroundColor = UIColor(red: CGFloat(redValue)/255.0, green: CGFloat(greenValue)/255.0, blue: CGFloat(blueValue)/255.0, alpha: 1)
        
            view.backgroundColor = UIColor(colorLiteralRed: Float(redValue)/255.0, green: Float(greenValue)/255.0, blue: Float(blueValue)/255.0, alpha: 1)
    }


}

