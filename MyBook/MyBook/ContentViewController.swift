
//
//  ContentViewController.swift
//  MyBook
//
//  Created by l5ee on 2017/4/25.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    var nowPageNumber = 0
    
    @IBOutlet weak var mainImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mainImageView.image = UIImage(named: "\(nowPageNumber)")
        
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
