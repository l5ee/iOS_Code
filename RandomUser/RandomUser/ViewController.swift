//
//  ViewController.swift
//  RandomUser
//
//  Created by l5ee on 2017/4/20.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit
import AudioToolbox




class ViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    var infoTableViewController: InfoTableViewController?
    let apiAddress = "https://randomuser.me/api/"
    let reachability = Reachability(hostName: "wwww.apple.com")
    lazy var session = {URLSession(configuration: .default)}()
    var isDownloading = false
    
    @IBAction func makeNewUser(_ sender: UIBarButtonItem) {
        if isDownloading == false {
            downloadWithURLSession(webAddress: apiAddress)
        }
        
    }
    //session方法
    func downloadWithURLSession(webAddress: String) {
        if let url = URL(string: webAddress) {
            if internetOK() == true {
                let task = session.dataTask(with: url, completionHandler: {
                    (data, response, error) in
                    if error != nil {
                        DispatchQueue.main.async {
                            self.popAlert(title: "对不起", message: error!.localizedDescription)
                        }
                        self.isDownloading = false
                        return
                    }
                    if data != nil {
                        do {
                            let downloadedData = try Data(contentsOf: url)
                            let json = try JSONSerialization.jsonObject(with: downloadedData, options: [])
                            DispatchQueue.main.async {
                                self.parseJSON(json: json)
                            }
                        }catch {
                            DispatchQueue.main.async {
                                self.popAlert(title: "对不起", message: error.localizedDescription)
                            }
                        }
                    }else {
                        self.isDownloading = false

                    }
                
                })
                task.resume()
                isDownloading = true
            }else {
                popAlert(title: "没有网络", message: "请稍后再试")
            }
        }else {
            popAlert(title: "对不起", message: "不能产生随机的使用者")
        }
    }
    
    
    func parseJSON(json: Any) {
        if let okJSON = json as? [String: Any] {
            if let infoArray = okJSON["results"] as? [[String: Any]] {
                let infoDictionary = infoArray[0]
                let loadeName = userFullName(nameDictionary: infoDictionary["name"])
                let loadedEmail = infoDictionary["email"] as? String
                let loadedPhone = infoDictionary["phone"] as? String
                let imageDictionary = infoDictionary["picture"] as? [String: String]
                let loadedImageAddress = imageDictionary?["large"]
                let loadedUser = User(name: loadeName, number: loadedPhone, email: loadedEmail, image: loadedImageAddress)
                
                settingInfo(user: loadedUser)
            }else {
                self.isDownloading = false
            }
        }else {
            self.isDownloading = false
        }
    }
    
    func userFullName(nameDictionary: Any?) -> String? {
        if let okDictionary = nameDictionary as? [String: String] {
            let firstName = okDictionary["first"] ?? ""
            let lastName = okDictionary["last"] ?? ""
            return firstName + " " + lastName
        }else {
            return nil
        }
    }
    
    //data方法
    func downloadWithData(webAddress: String) {
        if let url = URL(string: webAddress) {
            if internetOK() == true {
                DispatchQueue.global().async {
                    do {
                        let downloadedData = try Data(contentsOf: url)
                        print (try JSONSerialization.jsonObject(with: downloadedData, options: []))
                    }catch {
                        DispatchQueue.main.async {
                            self.popAlert(title: "对不起", message: error.localizedDescription)
                        }
                    }
                }
            }else {
                popAlert(title: "没有网络", message: "请稍后再试")
            }
            
            
        }else {
            popAlert(title: "对不起", message: "不能产生随机的使用者")
    
        }

    }
   
    
    
    func popAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "好", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    //判断是否连接网络
    func internetOK() -> Bool {
        if reachability?.currentReachabilityStatus().rawValue == 0 {
            
            return false
        
        }else {
            return true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //改变navigation Bar的颜色
        navigationController?.navigationBar.barTintColor = UIColor(red:0.08, green:0.49, blue:0.98, alpha:1.00)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
//       a let aUser = User(name: "L5EE", number: "888-888888", email: "bo.leeing@gmail.com", image: "http://picture.me")
//        settingInfo(user: aUser)
//        downloadWithData(webAddress: apiAddress)
        downloadWithURLSession(webAddress: apiAddress)
    }
    
    func settingInfo(user:User) {
        AudioServicesPlayAlertSound(1000)
        userName.text = user.name
        infoTableViewController?.phoneLabel.text = user.number
        infoTableViewController?.emailLabel.text = user.email
        if let imageAddress = user.image {
            if let imageURL = URL(string: imageAddress) {
                let task = session.downloadTask(with: imageURL, completionHandler: {
                    (url, response,error) in
                    if error != nil {
                        DispatchQueue.main.async {
                            self.popAlert(title: "对不起", message: error!.localizedDescription)
                        }
                        self.isDownloading = false
                        return
                    }
                    if let okURL = url {
                        do {
                            let downloadImage = UIImage(data: try Data(contentsOf: okURL))
                            DispatchQueue.main.async {
                                self.userImage.image = downloadImage
                                self.isDownloading = false
                            }
                            
                        }catch {
                            
                            DispatchQueue.main.async {
                                self.popAlert(title: "对不起", message: error.localizedDescription)
                                self.isDownloading = false
                            }
                            
                        }
                    }
                    
                })
                task.resume()
            }else {
                self.isDownloading = false
            }
        }else {
            self.isDownloading = false
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        //设置用户头像为圆形
        userImage.layer.cornerRadius = userImage.frame.size.width / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moreInfo" {
            infoTableViewController = segue.destination as? InfoTableViewController
        }
    }

}

