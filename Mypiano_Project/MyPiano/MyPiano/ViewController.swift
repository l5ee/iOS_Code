//
//  ViewController.swift
//  MyPiano
//
//  Created by l5ee on 2017/4/17.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioMatrix = [AVAudioPlayer?]()
    
    @IBOutlet var playSound: [SpringButton] = []
    @IBAction func playSound(_ sender: AnyObject) {
        //点击的动画
        playSound[sender.tag].animation = "fadeIn"
        playSound[sender.tag].animate()
        audioMatrix[sender.tag]?.stop()
        audioMatrix[sender.tag]?.currentTime = 0.0
        audioMatrix[sender.tag]?.play()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...7 {
            guard let path = Bundle.main.path(forResource: "\(i + 1)", ofType: "mp3") else {
                audioMatrix.append(nil)
                return
            }
            
            let url = URL(fileURLWithPath: path)
            
            do{
                audioMatrix.append(try AVAudioPlayer(contentsOf: url))
                
            }catch{
                audioMatrix.append(nil)
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //禁止横屏
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }

}

