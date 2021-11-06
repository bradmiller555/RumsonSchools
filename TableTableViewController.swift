//
//  TableTableViewController.swift
//  Rumson School District
//
//  Created by Brad Miller on 8/2/17.
//  Copyright © 2017 Brad Miller. All rights reserved.
//

import UIKit

class TableTableViewController: UITableViewController {
    
    var URL = ""

    var URLs:Array<String> = [""]
    
    var item:Array<String> = [""]

    @IBAction func refresh(_ sender: UIRefreshControl) {
        var newURLs:Array<String> = [""]
        URLs.append(newURLs[0])
        
        var newItems:Array<String> = [""]
        item.append(newItems[0])
        
        refreshControl?.endRefreshing()
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return URLs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        if indexPath.row>=0{
            cell.textLabel?.text = item[indexPath.row]
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row>=0{
            URL = URLs [indexPath.row]
            performSegue(withIdentifier: "webSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "webSegue"{
            let destination = segue.destination as! WebViewController
            destination.content = URL
        }
    }
}
