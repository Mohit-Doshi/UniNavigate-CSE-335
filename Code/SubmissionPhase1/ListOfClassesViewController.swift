//
//  ListOfClassesViewController.swift
//  SubmissionPhase1
//
//  Created by Mohit.
//  Copyright © 2018 Mohit D. All rights reserved.
//

import UIKit
// actually for classrooms
class ListOfClassesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var croomsTable: UITableView!
    
    var arrayOFclassrooms:NSArray? // sent from ListOfFloorsViewController
    var croomnum:[String] = []
    var ciobj:CourseInfoModel = CourseInfoModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 0..<(arrayOFclassrooms?.count)!
        {
            var temp:NSDictionary = arrayOFclassrooms?[i] as! NSDictionary
            croomnum.append(temp["number"] as! String)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (arrayOFclassrooms?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassRoomCell", for: indexPath) as! ClassTableViewCell
        cell.layer.borderWidth = 1.0
        cell.ClassNameLabel.text = "Room \(croomnum[indexPath.row])"
        cell.backgroundColor = UIColor.green

        // cell.BuildingImage.image = UIImage(named: "download.jpg")
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let selectedIndex: IndexPath = self.croomsTable.indexPath(for: sender as! UITableViewCell)!
        let des = segue.destination as! DetailedViewController
        // Pass the selected object to the new view controller.
        var temp:NSDictionary = arrayOFclassrooms?[selectedIndex.row] as! NSDictionary
        var cond = ciobj.doesCourseInfoExist(eyeDee: (temp["id"] as? String)!)
        des.doescourseinfoexist = cond
        des.ci = temp["id"] as? String
        
    }
    
    @IBAction func fromDetailedViewController(segue: UIStoryboardSegue) // unwind segue method
    {

     /*   if let sourceViewController = segue.source as? DetailedViewController
        {
        
        }*/
        
    }
    

}
