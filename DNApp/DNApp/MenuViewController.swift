//
//  MenuViewController.swift
//  DNApp
//
//  Created by l5ee on 2017/3/18.
//  Copyright © 2017年 Boom. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

   
    @IBOutlet weak var dialogView: DesignableView!

    @IBAction func closeButtonDidTouch(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        dialogView.animation = "fall"
        dialogView.animate()
        
        
    }
}
