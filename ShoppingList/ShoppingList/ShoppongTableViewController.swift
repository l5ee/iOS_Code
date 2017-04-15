//
//  ShoppongTableViewController.swift
//  ShoppingList
//
//  Created by l5ee on 2017/4/13.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class ShoppongTableViewController: UITableViewController {
    
    var shoppingItems = [String]()
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        popUpAlertWithDefault(nil){
            (success, result) in
            if success == true {
                if let okResult = result {
                    self.shoppingItems.append(okResult)
                    //tableView.reloadData()
                    let insertInfoAtThisIndexPath = IndexPath(row: self.shoppingItems.count - 1, section: 0)
                    self.tableView.insertRows(at: [insertInfoAtThisIndexPath], with: .left)
                    self.saveList()
                }
            }
        }
        
    }
    
    // 存档
    func saveList() {
        UserDefaults.standard.set(shoppingItems, forKey: "list")
        UserDefaults.standard.synchronize()
    }
    //读档
    func loadList() {
        if let okList = UserDefaults.standard.stringArray(forKey: "list") {
            shoppingItems = okList
        }
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        popUpAlertWithDefault(shoppingItems[indexPath.row]){
            (success, result) in
            if success == true {
                if let okResult = result {
                    self.shoppingItems[indexPath.row] = okResult
                    tableView.reloadData()
                    self.saveList()
                }
            }
        }
    }
    //删除Item
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shoppingItems.remove(at: indexPath.row)
            saveList()
            tableView.reloadData()
        }
    }
    
    typealias  AddItemClosure = (Bool,String?)->()
    
    func popUpAlertWithDefault(_ defaultValue:String?, withCompletionHandler handler: @escaping AddItemClosure) {
        let alert = UIAlertController(title: "添加新物品", message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: {
            (textfield) in
            textfield.placeholder = "在这添加一个新的物品"
            textfield.text = defaultValue
        })
        let okAction = UIAlertAction(title: "确定", style: .default, handler: {
            (action) in
            //按下按钮后做的事情
            //拿出文字输入框的文字
            if let inputText = alert.textFields?[0].text {
                if inputText != "" {
                    handler(true, inputText)
                    
                }else {
                    handler(false, nil)
                }
            }
        
        })
        let cancelAction = UIAlertAction(title: "取消", style: .default, handler: {
            (action) in
            handler(false, nil)
        })
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return shoppingItems.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = shoppingItems[indexPath.row]

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
