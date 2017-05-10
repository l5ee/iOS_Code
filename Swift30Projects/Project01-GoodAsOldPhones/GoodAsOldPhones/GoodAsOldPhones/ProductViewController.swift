//
//  ProductViewController.swift
//  GoodAsOldPhones
//
//  Created by l5ee on 2017/5/5.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var ProductImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!

    
    var product: Product?
    override func viewDidLoad() {
        super.viewDidLoad()

        productNameLabel.text = product?.name
        
        if let imageName = product?.fullscreenImageName {
            ProductImageView.image = UIImage(named: imageName)
        }
    }
    @IBAction func addCartPressed(_ sender: UIButton) {
        print("Hello World")
    }

    
}
