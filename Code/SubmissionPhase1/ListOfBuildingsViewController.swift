//
//  ListOfBuildingsViewController.swift
//  SubmissionPhase1
//
//  Created by Mohit.
//  Copyright © 2018 Mohit D. All rights reserved.
//

import UIKit

class ListOfBuildingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var jsonfromviewctrl:NSDictionary? // gets JSON data during push segue
    var bs:NSArray?
    var bload:[String] = []

    @IBOutlet weak var buildingsTable: UITableView!
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        bs = jsonfromviewctrl!["buildings"] as? NSArray     // getting all the buildings into bs int the form of an array
        print("Number of members in bs : \(bs!.count)")     // for the programmer to know how many buildings there are
        for i in 0..<bs!.count
        {
            var btemp:NSDictionary = bs![i] as! NSDictionary    // going through each of the elements in bs, parsing each of them as a Dictionary object
            bload.append(btemp["name"] as! String)          // appending only the values from the name-keys for each of the dictionary objects into an array
        }
        buildingsTable.isScrollEnabled = true // actually true by default
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return bs!.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BuildingCell", for: indexPath) as! BuildingTableViewCell
            cell.layer.borderWidth = 1.0
            cell.BuildingNameLabel.text = bload[indexPath.row]
            cell.backgroundColor = UIColor.blue
            cell.BuildingImage.image = UIImage(named: "innovation.jpg")
            return cell
        }
        // Do any additional setup after loading the view.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let selectedIndex: IndexPath = self.buildingsTable.indexPath(for: sender as! UITableViewCell)!
        let des = segue.destination as! ListOfFloorsViewController
        var temp:NSDictionary = bs![selectedIndex.row] as! NSDictionary // accessing the particular dictionary element in the bs array
        des.sentBuildingName = temp["name"] as? String                  // parsing only the name as a String
        des.sentBuildingAddress = temp["address"] as? String           // parsing only the address as a String
        des.arrayOFfloors = temp["floors"] as? NSArray                // sending the entire array of floors as an NSArray
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
