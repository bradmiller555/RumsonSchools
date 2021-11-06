//
//  ClubsViewController.swift
//  Rumson School District
//
//  Created by Brad Miller on 8/23/17.
//  Copyright © 2017 Brad Miller. All rights reserved.
//

import UIKit

class ClubsViewController: UIViewController, UIWebViewDelegate {
    
    var websites:Array<String> = ["http://rumsonschool.org/rumson/Forrestdale/Sports%20and%20Clubs/Clubs%20Home/", "http://rumsonschool.org/rumson/Forrestdale/Sports%20and%20Clubs/Sports%20Home/", "http://rumsonschool.org/rumson/Forrestdale/Sports%20and%20Clubs/Drama%20Club/", "http://rumsonschool.org/rumson/Forrestdale/Sports%20and%20Clubs/National%20Junior%20Honor%20Society/"]
    
    var content = ""

    @IBOutlet weak var Controller: UISegmentedControl!
    
    @IBOutlet weak var WebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WebView.delegate = self
        WebView.scalesPageToFit = true
        if Controller.selectedSegmentIndex >= 0{
            if let pdf = NSURL (string: websites[0]){
                let req = NSURLRequest(url:pdf as URL)
                print ("Site Loaded")
                WebView.loadRequest(req as URLRequest)
            }
        }
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

    @IBAction func ControllerChange(_ sender: Any) {
        if Controller.selectedSegmentIndex >= 0{
            if let pdf = NSURL (string: websites[Controller.selectedSegmentIndex]){
                let req = NSURLRequest(url:pdf as URL)
                print ("load pdf document")
                WebView.loadRequest(req as URLRequest)
            }
        }
    }
}
