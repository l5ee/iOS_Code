//
//  ViewController.swift
//  HelloDownloadImage
//
//  Created by l5ee on 2017/4/20.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    var session:URLSession?
    override func viewDidLoad() {
        super.viewDidLoad()
//        Data(contentsOf: <#T##URL#>)
        let imageAddress = "https://images.unsplash.com/photo-1470338745628-171cf53de3a8?ixlib=rb-0.3.5&q=100&fm=jpg&crop=entropy&cs=tinysrgb&dl=adam-jaime-119565.jpg&s=6e4d98876d0e954d7e6d64f66b001898"
        session = URLSession(configuration: .default)
        
        
        if let imageURL = URL(string: imageAddress) {
            let task = session?.dataTask(with: imageURL, completionHandler: {
                (data, response, error) in
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                if let loadedData = data {
                    let loadedImage = UIImage(data: loadedData)
                    DispatchQueue.main.async {
                        self.myImageView.image = loadedImage
                    }
                }
            
            })
            task?.resume()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

