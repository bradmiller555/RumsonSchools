//
//  ContactsTableViewController.swift
//  Rumson School District
//
//  Created by Brad Miller on 8/2/17.
//  Copyright © 2017 Brad Miller. All rights reserved.
//

import UIKit
import MessageUI

class ContactsTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    
    var header = ["District", "Deane-Porter", "Forrestdale"]
    
    var rows = [10, 2, 4]
    
    var jobs:Array<String> = ["Superintendent of Schools", "Administrative Assistant, Superintendent", "School Business Adminstrator", "Administrative Assistant", "Business Admin./Accts. Payable/Receivable", "Administrative Assistant, Business Administrator/Payroll", "Supervisor of Special Education", "Administrative Assistant, Sup. of Special Education", "Supervisor of Curriculum, Instruction & Assessments", "Administrative Assistant, Sup. Curr., Instr. & Assessments", "Supervisor of Building and Grounds", "Principal, Deane Porter School", "Administrative Assistant, Principal", "Principal, Forrestdale School", "Administrative Assistant, Principal", "Supervisor of Guidance", "Administrative Assistant, Guidance"]
    
    var names:Array<String> = ["Dr. John E. Bormann", "Ms. Denise Guerci", "Ms. Debra Allen", "Mrs. Dara Burke", "Ms. Pat Caudo", "Mr. Michael Snyder", "Ms. Laura Randazzo", "Mrs. Vera Ridoux", "Mrs. Jen Wargo", "Mr. James O'Brien", "Ms. Shari Feeney", "Mrs. Diane Ryan", "Mrs. Jennifer Gibbons", "Mrs. Tricia Zifchak", "Mrs. Kerri Walsifer", "Mrs. Antoinette Zimbile"]
    
    var phoneNumber:Array<String> = ["7328424747", "7328424747", "7328420354", "7328420354", "7328420354", "7328420811", "7328420811", "7329453100", "7329453100", "7328420383,324", "7328420330,350", "7328420330,350", "7328420383,314", "7328420383,314", "7328420383,316", "7328420383,331"]
    
    var phoneText:Array<String> = ["732-842-4747", "732-842-4747", "732-842-0354", "732-842-0354", "732-842-0354", "732-842-0811", "732-842-0811", "732-945-3100", "732-945-3100", "732-842-0383 x324", "732-842-0330 x350", "732-842-0330 x350", "732-842-0383 x314", "732-842-0383 x314", "732-842-0383 x316", "732-842-0383 x331"]
    
    var EMail:Array<String> = ["jbormann@rumsonschool.org", "dguerci@rumsonschool.org", "dallen@rumsonschool.org", "dburke@rumsonschool.org", "pcaudo@rumsonschool.org", "msnyder@rumsonschool.org", "lrandazzo@rumsonschool.org", "vridoux@rumsonschool.org", "jwargo@rumsonschool.org", "jobrien@rumsonschool.org", "sfeeney@rumsonschool.org", "dryan@rumsonschool.org", "jgibbons@rumsonschool.org", "tzifchak@rumsonschool.org", "kwalsifer@rumsonschool.org", "azimbile@rumsonschool.org"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rows[section]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)
        if indexPath.section==0{
            if indexPath.row>=0{
                cell.textLabel?.text = jobs[indexPath.row]
                cell.detailTextLabel?.text = names[indexPath.row]
            }
        }
        if indexPath.section==1{
            if indexPath.row>=0{
                cell.textLabel?.text = jobs[indexPath.row + 10]
                cell.detailTextLabel?.text = names[indexPath.row + 10]
            }
        }
        if indexPath.section==2{
            if indexPath.row>=0{
                cell.textLabel?.text = jobs[indexPath.row + 12]
                cell.detailTextLabel?.text = names[indexPath.row + 12]
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return header[section]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section==0{
            if indexPath.row>=0{
                let alert = UIAlertController(title: "Call or E-Mail", message: names[indexPath.row], preferredStyle: .alert)
                let phoneAction = UIAlertAction(title: phoneText[indexPath.row], style: .default, handler: { Void in
                    let url:NSURL = URL(string: "TEL://" + self.phoneNumber[indexPath.row])! as NSURL
                    UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                    print("complete")
                })
                let emailAction = UIAlertAction(title: EMail[indexPath.row], style: .default, handler: { Void in
                    let mailCompose = MFMailComposeViewController()
                    mailCompose.mailComposeDelegate = self
                    mailCompose.setToRecipients(self.EMail)
                    if MFMailComposeViewController.canSendMail(){
                        self.present(mailCompose, animated: true, completion: nil)
                    }
                    else{
                        print("error")
                    }
                })
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alert.addAction(phoneAction)
                alert.addAction(emailAction)
                alert.addAction(cancelAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
        if indexPath.section==1{
            if indexPath.row>=0{
                let alert = UIAlertController(title: "Call or E-Mail", message: names[indexPath.row + 10], preferredStyle: .alert)
                let phoneAction = UIAlertAction(title: phoneText[indexPath.row + 10], style: .default, handler: { Void in
                    let url:NSURL = URL(string: "TEL://" + self.phoneNumber[indexPath.row + 10])! as NSURL
                    UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                    print("complete")
                })
                let emailAction = UIAlertAction(title: EMail[indexPath.row + 10], style: .default, handler: { Void in
                    let mailCompose = MFMailComposeViewController()
                    mailCompose.mailComposeDelegate = self
                    mailCompose.setToRecipients(self.EMail)
                    if MFMailComposeViewController.canSendMail(){
                        self.present(mailCompose, animated: true, completion: nil)
                    }
                    else{
                        print("error")
                    }
                })
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alert.addAction(phoneAction)
                alert.addAction(emailAction)
                alert.addAction(cancelAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
        if indexPath.section==2{
            if indexPath.row>=0{
                let alert = UIAlertController(title: "Call or E-Mail", message: names[indexPath.row + 12], preferredStyle: .alert)
                let phoneAction = UIAlertAction(title: phoneText[indexPath.row + 12], style: .default, handler: { Void in
                    let url:NSURL = URL(string: "TEL://" + self.phoneNumber[indexPath.row + 12])! as NSURL
                    UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                    print("complete")
                })
                let emailAction = UIAlertAction(title: EMail[indexPath.row + 12], style: .default, handler: { Void in
                    let mailCompose = MFMailComposeViewController()
                    mailCompose.mailComposeDelegate = self
                    mailCompose.setToRecipients(self.EMail)
                    if MFMailComposeViewController.canSendMail(){
                        self.present(mailCompose, animated: true, completion: nil)
                    }
                    else{
                        print("error")
                    }
                })
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alert.addAction(phoneAction)
                alert.addAction(emailAction)
                alert.addAction(cancelAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
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
