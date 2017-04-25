//
//  MasterViewController.swift
//  HelloSplitViewController
//
//  Created by l5ee on 2017/4/25.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    let appleProduct = ["iPhone", "iPad", "iPod", "Apple TV", "Apple Watch"]


    override func viewDidLoad() {
        super.viewDidLoad()
        splitViewController?.preferredDisplayMode = .allVisible
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 


    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appleProduct.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel!.text = appleProduct[indexPath.row]
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let dvc = segue.destination as? UINavigationController
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let detailViewController = dvc?.topViewController as? DetailViewController
                detailViewController?.detailItem = appleProduct[indexPath.row]
            }
        }
    }

    


}

