//
//  ViewController.swift
//  HelloRecordAudio
//
//  Created by l5ee on 2017/4/17.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit
import AVFoundation

enum AudioSessionMode {
    case record
    case play
}

class ViewController: UIViewController, AVAudioRecorderDelegate {
    
    var recordHelper:RecordHelper?
    
    
    
    @IBAction func recordAudio(_ sender: UIButton) {
        recordHelper?.recordAudio()
    }
    
    @IBAction func stopRecord(_ sender: UIButton) {
        recordHelper?.stopRecord()
    }
    
    @IBAction func playRecordSound(_ sender: UIButton) {
        recordHelper?.playRecordSound()
    }
    
    @IBAction func stopPlay(_ sender: UIButton) {
        recordHelper?.stopPlay()
    }

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recordHelper = RecordHelper()
    }

}

