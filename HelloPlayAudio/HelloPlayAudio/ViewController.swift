//
//  ViewController.swift
//  HelloPlayAudio
//
//  Created by l5ee on 2017/4/17.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var audioPlayer:AVAudioPlayer?
    
    @IBAction func play(_ sender: UIButton) {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0.0
        audioPlayer?.play()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //找到音档的路径
        guard let newPath = Bundle.main.path(forResource: "Right", ofType: "mp3") else {
            print("no such path")
            return
        }
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: newPath))
        }catch{
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

