//
//  HomeCollectionViewController.swift
//  Rumson School District
//
//  Created by Brad Miller on 7/31/17.
//  Copyright © 2017 Brad Miller. All rights reserved.
//

import UIKit

private let reuseIdentifier = "selection"

class HomeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var segueName = ""
    
    var URL = ""
    
    var URLs: Array<String> = ["http://rumsonschool.org/rumson/District%20Calendar/Calendar/Monthly%20Calendar/_print_cal?month=", "http://rumsonschool.org/rumson/Deane%20Porter/Lunch/", "https://parents.genesisedu.com/rumson/parents?gohome=true", "http://rumsonschool.org/rumson/District%20Calendar/Calendar/2017-2018%20School%20Calendar.pdf?1501647436", "https://twitter.com/Rumsonbulldawgs?ref_src=twsrc%5Etfw&ref_url=http%3A%2F%2Frumsonschool.org%2Frumson%2F"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
        
        let today = Date()
    
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM%20yyyy"
        let monthYear = formatter.string(from: today)
        
        URLs[1] = URLs[1] + monthYear + "%20menu.pdf"
        
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "MM&year=yyyy"
        let monthYearNum = formatter1.string(from: today)
        
        URLs[0] = URLs[0] + monthYearNum
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
        return 6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:HomeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HomeCollectionViewCell
        if (indexPath.row==0){
            cell.photo.image = UIImage (named: "UpcomingEvents")
        }
        else if (indexPath.row==1){
            cell.photo.image = UIImage (named: "LunchMenu")
        }
        else if (indexPath.row==2){
            cell.photo.image = UIImage (named: "Genesis")
        }
        else if (indexPath.row==3){
            cell.photo.image = UIImage (named: "YearCal")
        }
        else if (indexPath.row==4){
            cell.photo.image = UIImage (named: "Twitter")
        }
        else if (indexPath.row==5){
            cell.photo.image = UIImage (named: "Contacts")
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (indexPath.row>=0 && indexPath.row<=4){
            segueName = "webSegue"
            URL = URLs[indexPath.row]
        }
        else if (indexPath.row==5){
            segueName = "contactSegue"
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
    }
}
