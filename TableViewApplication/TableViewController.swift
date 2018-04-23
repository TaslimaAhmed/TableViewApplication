//
//  TableViewController.swift
//  TableViewApplication
//
//  Created by MobioApp on 12/3/17.
//  Copyright © 2017 MobioApp. All rights reserved.
//

import UIKit
import Foundation

class TableViewController: UITableViewController {
    
    var nameArray = ["Ekramul Hoque","Taslima Ahmed",
                     "Aminul Islam","Evan Khan","Saiful Islam","Ujjal Kumar Roy","MD. Kamrul Hasan"]
    
    var UniversityArray  = ["Manarat Int University","ULAB","Bangladesh University of Engineering & Technology ","AIUB","AIUB","NUB","Stamford University Bangladesh"]
    
    var passingYearArray  = ["2015","2015","2017","2017","2016","2019","2017"]
    var shopContactArray = ["01712896969","01712896970","01712896971","01712896972","01712896973","01712896974","01712896975"]

    var countryArray = [String]()
    var capitalArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var plistDict : NSDictionary?
        
        let path = Bundle.main.path(forResource: "CustomPlist", ofType: "plist")
        plistDict = NSDictionary(contentsOfFile : path!)
        
        let countryDict  = plistDict?.value(forKey: "Country") as! NSDictionary?
        
        for each in countryDict! {
            print("The capital of \(each.key) is \(each.value)")
            countryArray.append(each.key as! String)
            capitalArray.append(each.value  as! String)
        }
        print(countryArray)
        print(capitalArray)
       // tableView.delegate = self
       // tableView.dataSource = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        print("1")
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("2")
        return nameArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CustomTableViewCell
        cell.nameLabel.text = nameArray[indexPath.row]
        cell.universityLabel.text = UniversityArray[indexPath.row]
        cell.passingYearLabel.text = passingYearArray[indexPath.row]
        //cell.callButton.tag = indexPath.row
        
         print("3")
        return cell
    }
    

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            nameArray.remove(at: indexPath.row)
            UniversityArray.remove(at: indexPath.row)
            passingYearArray.remove(at: indexPath.row)
            //nameArray.removeAtIndex(indexPath.row)
            // UniversityArray.removeAtIndex(indexPath.row)
            //passingYearArray.removeAtIndex(indexPath.row)
            self.tableView.reloadData()
        }
        
    }
   
    @IBAction func makeAPhoneCall(_ sender: Any) {
        
        let button = sender as! UIButton
        let index = button.tag
        print(" call button tag for selected index : \(index) ")
        
        let PhoneNumberString = shopContactArray[index]
        
        if let phoneCallURL:URL = URL(string: "tel:\(PhoneNumberString)") {
            
            let application:UIApplication = UIApplication.shared
            
            if (application.canOpenURL(phoneCallURL)) {
                
                let alertController = UIAlertController(title: "Car Life", message: "Are you sure you want to call \n\(PhoneNumberString)?", preferredStyle: .alert)
                
                let yesPressed = UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                    
                    application.openURL(phoneCallURL)
                })
                let noPressed = UIAlertAction(title: "No", style: .default, handler: { (action) in
                    
                })
                alertController.addAction(yesPressed)
                alertController.addAction(noPressed)
                
                present(alertController, animated: true, completion: nil)
            }
        }
        
        
    }
    
    
    

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
