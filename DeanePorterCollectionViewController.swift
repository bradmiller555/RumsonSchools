//
//  DeanePorterCollectionViewController.swift
//  Rumson School District
//
//  Created by Brad Miller on 7/31/17.
//  Copyright © 2017 Brad Miller. All rights reserved.
//

import UIKit

private let reuseIdentifier = "selection1"

class DeanePorterCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var segueName = ""
    
    var URL = ""
    
    var URLs:Array<String> = ["http://rumsonschool.org/rumson/Recent%20News/Bell%20Schedule/2016-17%20Deane-Porter%20Bell%20Schedule%20with%20PreK.pdf?1501697626", "http://rumsonschool.org/rumson/Deane%20Porter/", "http://rumsonschool.org/rumson/Deane%20Porter/2017-2018%20Academic%20Dates.pdf?1503765514", "http://rumsonschool.org/rumson/Deane%20Porter/Virtual%20Backpack/"]
    
    let address = "14 Black Point Rd Rumson, NJ 07760"

    override func viewDidLoad() {
        super.viewDidLoad()
        /*let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 42)
        imageView.image = UIImage(named: "DPBanner.png")
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        */
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:DeanePorterCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DeanePorterCollectionViewCell
        if (indexPath.row==0){
            cell.photo1.image = UIImage (named: "DPNews")
        }
        else if (indexPath.row==1){
            cell.photo1.image = UIImage (named: "DPBackpack")
        }
        /*else if (indexPath.row==2){
            cell.photo1.image = UIImage (named: "DPBell")
        }*/
        else if (indexPath.row==2){
            cell.photo1.image = UIImage (named: "AcademicCal")
        }
        else if (indexPath.row==3){
            cell.photo1.image = UIImage (named: "Map")
        }
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (indexPath.row==0){
            segueName = "webSegue"
            URL = URLs[1]
        }
        else if (indexPath.row==1){
            //segueName = "tableSegue"
            segueName = "webSegue"
            URL = URLs[3]
        }
        /*else if (indexPath.row==2){
            segueName = "webSegue"
            URL = URLs[0]
        }
        else if (indexPath.row==3){
            segueName = "webSegue"
            URL = URLs[2]
        }*/
        else if (indexPath.row==2){
            segueName = "webSegue"
            URL = URLs[2]
        }
        else if (indexPath.row==3){
            segueName = "mapSegue"
        }
        performSegue(withIdentifier: segueName, sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width/2, height: width/2)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "webSegue"{
            let destination = segue.destination as! WebViewController
            destination.content = URL
        }
        else if segue.identifier == "mapSegue"{
            let destination1 = segue.destination as! MapViewController
            destination1.address = address
        }
    }
}
