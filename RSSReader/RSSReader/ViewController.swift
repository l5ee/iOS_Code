//
//  ViewController.swift
//  RSSReader
//
//  Created by l5ee on 2017/4/24.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    var objects = [NewsItem]()
    var reachability = Reachability(hostName: "www.apple.com")
    lazy var session = {URLSession(configuration: .default)}()
    
    func internet() -> Bool {
        if reachability?.currentReachabilityStatus().rawValue == 0 {
            return false
        }else {
            return true
        }
    }
    
    func downloadXML(webAddress:String) {
        if internet() == true {
            //下载开始
            if let url = URL(string: webAddress) {
                let task = session.dataTask(with: url, completionHandler: {
                    (data, response, error) in
                    if error != nil {
                        DispatchQueue.main.async {
                            self.popAlert(withTitle: "错误", andMessage: error!.localizedDescription)
                        }
                        return
                    }
                    if let okData = data {
                        let parser = XMLParser(data: okData)
                        let rssParserDelegate = RSSParserDelegate()
                        parser.delegate = rssParserDelegate
                        if parser.parse() == true {
                            self.objects = rssParserDelegate.getResult()
                            DispatchQueue.main.async {
                                self.myTableView.reloadData()
                            }
                            
                        }else {
                            print("parse fail")
                        }
                    }
                })
                task.resume()
            }
            
        }else {
            popAlert(withTitle: "没有网络", andMessage: "请稍后再试!")
        }
    }
    //生成警告控制器
    func popAlert(withTitle title:String, andMessage message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "好", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        
        downloadXML(webAddress: "https://www.cnet.com/rss/iphone-update/")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = objects[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moreInfo" {
            let dvc = segue.destination as? WebViewController
            if let selectedRow = myTableView.indexPathForSelectedRow?.row {
                dvc?.webAddressFromViewOne = objects[selectedRow].link
            }
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

