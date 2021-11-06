//
//  WebViewController.swift
//  Rumson School District
//
//  Created by Brad Miller on 7/31/17.
//  Copyright © 2017 Brad Miller. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var Website: UIWebView!
    
    var content = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Website.delegate = self
        Website.scalesPageToFit = true
        
        if let pdf = NSURL (string: content){
            let req = NSURLRequest(url:pdf as URL)
            print ("load pdf document")
            Website.loadRequest(req as URLRequest)
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

}
