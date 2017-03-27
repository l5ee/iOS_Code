//
//  LoginViewController.swift
//  DNApp
//
//  Created by l5ee on 2017/3/16.
//  Copyright © 2017年 Boom. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var dialogView: DesignableView!

    @IBAction func loginButtonDidTouch(_ sender: AnyObject) {
        dialogView.animation = "shake"
        dialogView.animate()
    }

    @IBAction func closeButtonDidTouch(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
        dialogView.animation = "zoomOut"
        dialogView.animate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

}
