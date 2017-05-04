//
//  SecondViewController.swift
//  CircleButton
//
//  Created by l5ee on 2017/5/4.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dismissButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissButton.layer.cornerRadius = dismissButton.frame.size.width / 2
    }

    @IBAction func dismissSecondVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
