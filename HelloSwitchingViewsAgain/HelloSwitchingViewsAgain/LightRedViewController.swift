//
//  LightRedViewController.swift
//  HelloSwitchingViewsAgain
//
//  Created by l5ee on 2017/4/8.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class LightRedViewController: UIViewController {

    @IBAction func backToView1(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
        
        
    }
    @IBAction func gotoView3(_ sender: UIButton) {
        
        let lightGreen = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "lightGreen")

        present(lightGreen, animated: true, completion: nil)
//        self.navigationController?.pushViewController(lightGreen, animated: true)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
