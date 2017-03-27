//
//  LearnViewController.swift
//  DNApp
//
//  Created by l5ee on 2017/3/17.
//  Copyright © 2017年 Boom. All rights reserved.
//

import UIKit

class LearnViewController: UIViewController {

    @IBOutlet weak var dialogView: DesignableView!
    @IBOutlet weak var bookImageView: SpringImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        dialogView.animate()
    }

    @IBAction func learnButtonDidTouch(_ sender: AnyObject) {
        bookImageView.animation = "pop"
        bookImageView.animate()
        
    }
    @IBAction func closeButtonDidTouch(_ sender: AnyObject) {
        
        dialogView.animation = "fall"
        dialogView.animateNext {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
