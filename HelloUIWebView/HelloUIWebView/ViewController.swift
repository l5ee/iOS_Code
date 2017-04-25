//
//  ViewController.swift
//  HelloUIWebView
//
//  Created by l5ee on 2017/4/20.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var myWebView: UIWebView!
    
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.delegate = self
        if let url = URL(string: "https://dribbble.com") {
            let request = URLRequest(url: url)
            myWebView.loadRequest(request)
        }
        
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        myActivityIndicator.startAnimating()
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myActivityIndicator.stopAnimating()

    }
    
    
    
    
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    


}

